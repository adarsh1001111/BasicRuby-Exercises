# Extend String to replace any vowel with * in a string input.
class String
  def replace
    regex = /[aeiou]/i # i for case-sensitiveness
    gsub(regex, '*')
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  puts input.replace
end
