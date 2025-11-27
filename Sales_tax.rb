# custom exception class for input exception
class InputError < StandardError; end

# class Validate for validations in the input
class ItemInputValidator
  VALID_BOOLEAN_INPUTS = /\A[yn]\z/i.freeze
  VALID_FLOAT_INPUT = /\A\d+(\.\d+)?\z/.freeze

  def self.validate_all_inputs(name, imported, exempted_from_sales, price)
    validate_name(name)
    validate_bool(imported)
    validate_bool(exempted_from_sales)
    validate_price(price)
  end

  def self.validate_price(input)
    raise InputError, 'Invalid Price: must be a number' unless input.match? VALID_FLOAT_INPUT
    raise InputError, 'Invalid Price: cannot be negative' if input.to_f.negative?
  end

  def self.validate_bool(input)
    raise InputError, 'Invalid input: please enter y or n.' unless input.match? VALID_BOOLEAN_INPUTS
  end

  def self.validate_name(input)
    raise InputError, 'Invalid name: please enter a valid name.' if input.empty?
  end
end

# class StringInterpretor for interpreting string value in different data types
class StringInterpretor
  def self.string_to_boolean(input)
    input.strip.downcase == 'y'
  end
end

# class Item for attributes of a single item
class Item
  attr_reader :name, :imported, :exempted_from_sales, :price

  SALES_TAX_RATE = 0.10
  IMPORT_DUTY_TAX_RATE = 0.05

  def initialize(name, imported, exempted_from_sales, price)
    ItemInputValidator.validate_all_inputs(name, imported, exempted_from_sales, price)
    @name = name
    @imported = StringInterpretor.string_to_boolean(imported)
    @exempted_from_sales = StringInterpretor.string_to_boolean(exempted_from_sales)
    @price = price.to_f.round(2)
  end

  def sales_tax
    @sales_tax ||= (sales_rate * price).round(2)
  end

  def sales_rate
    exempted_from_sales ? 0 : SALES_TAX_RATE
  end

  def import_duty_tax
    @import_duty_tax ||= (import_duty_rate * price).round(2)
  end

  def import_duty_rate
    imported ? IMPORT_DUTY_TAX_RATE : 0
  end

  def total_tax
    @total_tax ||= sales_tax + import_duty_tax
  end

  def total_price
    @total_price ||= price + total_tax
  end

  def to_s
    format(
      '| %<name>-20s | %<price>10.2f | %<sales_tax>10.2f | %<import_duty_tax>20.2f | ' \
      '%<total_tax>10.2f | %<total_price>12.2f |',
      name: name, price: price, sales_tax: sales_tax,
      import_duty_tax: import_duty_tax, total_tax: total_tax, total_price: total_price
    )
  end
end

# class ItemsBucket is for a bucket of many items
class ItemsBucket
  attr_accessor :items

  def initialize
    @items = []
  end

  def total_tax
    items.sum(&:total_tax)
  end

  def total_base
    items.sum(&:price)
  end

  def total_price
    items.sum(&:total_price)
  end

  def total_sales_tax
    items.sum(&:sales_tax)
  end

  def total_import_duty_tax
    items.sum(&:import_duty_tax)
  end

  def to_s
    puts "\nList of Items:"
    puts header
    display_each_item
    puts totals
  end

  def header
    format(
      '| %<name>-20s | %<price>10s | %<sales_tax>10s | %<import_duty_tax>20s | ' \
      '%<tax>10s | %<total>12s |',
      name: 'Item Name', price: 'Price', sales_tax: 'Sales Tax',
      import_duty_tax: 'Import Duty Tax', tax: 'Tax', total: 'Total Price'
    )
  end

  def display_each_item
    items.each { |item| puts item }
  end

  def totals
    format(
      '| %<name>-20s | %<total_base>10.2f | %<total_sales_tax>10.2f | ' \
      '%<total_import_duty_tax>20.2f | %<total_tax>10.2f | %<total>12.2f |',
      name: 'TOTAL', total_base: total_base, total_sales_tax: total_sales_tax,
      total_import_duty_tax: total_import_duty_tax, total_tax: total_tax, total: total_price
    )
  end
end

bucket = ItemsBucket.new

begin
  loop do
    print 'Name of the Product: '
    name = gets.chomp

    print 'Is the Item Imported? (y/n): '
    imported = gets.chomp

    print 'Is the Item Exempted From Sales Tax? (y/n): '
    exempted = gets.chomp

    print 'Price of the Product: '
    price = gets.chomp

    bucket.items << Item.new(name, imported, exempted, price)

    print 'Do you want to add more items? (y/n): '
    break unless StringInterpretor.string_to_boolean(gets.chomp)
  end

  puts bucket
rescue InputError => e
  puts "Error: #{e.message}"
  retry
end
