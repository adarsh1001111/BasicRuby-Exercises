# Custom Error thrown for negative numbers
class NegativeError < RuntimeError
end

# extended Integer class to return the factorial of any integer
class Integer
  def factorial
    raise NegativeError, 'Negative number entered' if negative?

    (1..self).inject(1) { |product, element| product * element }
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  begin
    puts input.to_i.factorial
  rescue NegativeError => e
    print e.message
  end
end