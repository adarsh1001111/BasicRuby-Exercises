# custom empty string Exception made
class EmptyStringErr < RuntimeError
end

# custom uppercase Exception made
class UppercaseErr < RuntimeError
end

# created a Name class , when its instance is made , i tried validating the input int it
class Name
  attr_accessor :firstname, :lastname

  def initialize(firstname, lastname)
    @firstname, @lastname = firstname, lastname
    raise EmptyStringErr, 'Firstname cannot be blank' if @firstname.nil?
    raise UppercaseErr, 'Firstname must start with uppercase letter' if @firstname[0] =~ /[a-z]/
    raise EmptyStringErr, 'Lastname cannot be blank' if @lastname.nil?

    print "Your name is #{firstname} #{lastname}"
  end
end

input = ARGV
begin
  Name.new(input[0], input[1])
rescue UppercaseErr => e
  print e.message
rescue EmptyStringErr => e
  print e.message
end