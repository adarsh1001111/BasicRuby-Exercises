# extended String class to reverse any string by word
class String
  def reverse_string_by_words
    split.reverse.join(' ')
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  p input.reverse_string_by_words
end