# Defined a Interest class to calculate the difference in simple and compound interests
class Interest
  RATE = 10.0
  def initialize
    yield self
  end

  def calculate_difference(*)
    si = simple_interest(*)
    ci = compound_interest(*)
    diff = ci - si
    puts 'Interest difference= %.2f' % diff
  end

  private

  def simple_interest(principle, time)
    principle * RATE / 100 * time
  end

  def compound_interest(principle, time)
    principle * ((1 + RATE / 100)**time - 1)
  end
end

input = ARGV
if input.empty?
  puts 'Please provide an input'
else
  p, t = input.map(&:to_f)
  Interest.new { |obj| obj.calculate_difference(p, t) }
end
