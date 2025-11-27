class Integer
  def fibonacci
    Enumerator.produce([0, 1]) { |a, b| [b, a + b] }.lazy
      .map(&:first)
      .take_while { |n| n < self }.select{|x| x.odd?}
      .to_a
  end
end
print 25.fibonacci