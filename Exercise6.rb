# defined parent class Vehicle
class Vehicle
  attr_reader :name
  attr_accessor :price
  def initialize(name, price)
    @name = name
    @price = price.to_i
  end

  def to_s
    self_class = self.class.name
    "#{self_class} Name: #{name}\n#{self_class} Price: #{price}\n"
  end
end

# defined sub class Bike
class Bike < Vehicle
  attr_reader :dealer
  def initialize(name, price, dealer)
    super(name, price)
    @dealer = dealer
  end

  def increase_price(percent_price_increase)
    self.price += price.to_f * 0.01 * percent_price_increase
  end

  def to_s
    super() + "Bike Dealer: #{dealer}\n"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  name, price, dealer, increase = ARGV
  bike = Bike.new(name, price, dealer)
  puts bike
  bike.increase_price(increase.to_f)
  puts "\nAfter #{increase.to_f} percent hike in price:"
  puts bike
end