# Monkey patched Integer class to support generation of prime numbers upto n
class Integer
  def generate_primes_upto
    (2..self).select do |num|
      prime? num
    end
  end

  private

  def prime?(num)
    (2..Math.sqrt(num)).step.none? { |divisible_by| (num % divisible_by).zero? }
  end
end

input = ARGV[0]
if input.nil?
  print 'Please provide an input'
else
  print input.to_i.generate_primes_upto
end
