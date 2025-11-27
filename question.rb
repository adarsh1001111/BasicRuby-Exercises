class A
  @instance_count = 0
  def self.increment
    @instance_count += 1
  end
  def initialize
    self.class.increment
  end
end

class B<A
    @instance_count=0
end