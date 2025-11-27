# extended Integer class to return the factorial of any integer
class Integer
  def factorial
    return 0 if negative?

    (1..self).inject(1) { |product, element| product * element }
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  puts input.to_i.factorial
end