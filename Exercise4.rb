# Extend String to check if input string is a palindrome or not.
class String
  def palindrome?
    self == reverse
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
elsif input.palindrome?
  puts 'Input string is a palindrome'
else
  puts 'Input string is not a palindrome'
end