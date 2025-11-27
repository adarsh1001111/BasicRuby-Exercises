# Extend Array with grouping by odd/even string lengths and hashing on odd and even length
class Array
  def to_odd_even_groups
    group_by { |el| el.length }
      .inject({}) do |hash, (len, elements)|
        parity = len.odd? ? 'odd' : 'even'
        (hash[parity] ||= []) << elements
        hash
      end
  end
end

input = ARGV[0]
if input.nil?
  puts 'Please provide an input'
else
  input = input[1..-2].split(',').map do |element|
    first = element[0]
    last = element[-1]
    element = element[1..-2] if (first == "'" && last == "'") || (first == '"' && last == '"')
    element.strip
  end
  puts input.to_odd_even_groups
end
