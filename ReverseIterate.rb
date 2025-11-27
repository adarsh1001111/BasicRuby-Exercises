# monkey patched array class to implement reverse_iterate
class Array
  def reverse_iterate
    index = size - 1
    while index >= 0
      yield self[index].to_s
      index -= 1
    end
  end
end

input = ARGV[0]
if input.nil?
  puts 'Please provide an input'
else
  puts (input.delete('[]').split(',').map { |s| s.strip.delete('"\'') }.reverse_iterate { |i| print "#{i} " })
end