# frozen_string_literal: true

# class PascalCalculator for methods regarding pascal's triangle
class PascalCalculator
  def generate_triangle(number)
    row = [1]
    number.to_i.times do
      yield row
      row = next_row(row)
    end
  end

  private

  def next_row(row)
    new_row = [1]
    (row.length - 1).times do |index|
      new_row << row[index] + row[index + 1]
    end
    new_row << 1
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  PascalCalculator.new.generate_triangle(input) { |row| puts "#{row.join ' '} " }
end
