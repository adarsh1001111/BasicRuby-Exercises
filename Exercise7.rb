# Overwritten to_s for swapcasing
class String
  def to_s
    swapcase
  end
end

input = ARGV
if input.empty?
  puts 'Please provide an input'
else
  puts input[0].to_s
end
