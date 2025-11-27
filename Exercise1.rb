# String counts alphabetic character occurrences in a string input.
class String
  def count_letters
    counts = ::Hash.new(0)
    regex = /[A-Z]/i
    each_char { |char| counts[char] += 1 if char =~ regex }
    counts
  end
end

input = ARGV[0]
if input.nil?
  puts 'Please provide an input'
else
  puts input.count_letters
end
