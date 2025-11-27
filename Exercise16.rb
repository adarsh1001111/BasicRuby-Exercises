# extended String class to highlight the input string
class String
  def highlight_search(pattern)
    count, regex = 0, /#{pattern}/i
    gsub!(regex) do |match|
      count += 1
      "(#{match})"
    end
    count
  end
end

input = ARGV
if input.empty?
  puts 'Please provide an input'
else
  text = input[0].dup
  occurences = text.highlight_search(input[1])
  puts text
  puts "Total occurrences found: #{occurences}"
end