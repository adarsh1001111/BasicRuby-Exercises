# Monkey patched String class to support counting of lower case characters,
# upper case characters,digit/numeric characters and special characters,
# also made a method for returning a string with all the counts of all characters
class String
  def count_all_cases
    arr = [0, 0, 0, 0]
    each_char do |ch|
      case ch
      when 'a'..'z' then arr[0] += 1
      when 'A'..'Z' then arr[1] += 1
      when '0'..'9' then arr[2] += 1
      else arr[3] += 1
      end
    end
    show_count arr
  end

  private

  def show_count(args)
    "Lowercase characters = #{args[0]}
Uppercase characters = #{args[1]}
Numeric characters = #{args[2]}
Special characters = #{args[3]}"
  end
end
input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  puts input.count_all_cases
end