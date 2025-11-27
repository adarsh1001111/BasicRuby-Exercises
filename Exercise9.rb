# extended Array class for returning hash
class Array
  def group_by_length
    length_hash = Hash.new { |hash, key| hash[key] = [] }
    each { |element| length_hash[element.length] << element }
    length_hash.sort.to_h
  end
end

input = ARGV
if ARGV.empty?
  puts 'Please provide an input'
else
  puts input[0].delete('[]').split(',').map { |s| s.strip.delete('"\'') }.group_by_length
end
