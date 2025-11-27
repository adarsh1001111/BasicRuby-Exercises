# extended String Class for returning array from String
class String
  def to_a
    self[1..-2].split(',').map do |element|
      first = element[0]
      last = element[-1]
      element = element[1..-2] if (first == "'" && last == "'") || (first == '"' && last == '"')
      element.strip.to_i
    end
  end
end

# power method with 'x' as parameter for Array class
class Array
  def power(x)
    collect { |element| element**x.to_i }
  end
end

input = ARGV
if input.empty?
  puts 'Please provide an input'
else
  print input[0].to_a.power(input[1])
end