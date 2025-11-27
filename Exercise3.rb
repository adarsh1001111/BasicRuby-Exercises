# Extends Integer to print Fibonacci series up to the given limit.
class Integer
  def fibonacci
    first, second = 1, 1
    while first <= self
      yield first if block_given?
      first, second = second, first + second
    end
  end
end

input = ARGV
if input.empty?
  puts 'Please provide an input'
else
  n = input[0].to_i
  n.fibonacci { |num| print "#{num} " }
end
