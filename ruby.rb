=begin
def method1
    yield "in method1"
end

def method2 
    yield "in method2"
end
{}
method1method2 do |x| 
    p x 
end

$global
var
@@class_var
@instance_var
@class_instance
=end
class Parent
    @@class_var=1
    attr_accessor :a
    def increase
        @@class_var+=1
        Parent.a+=1
    end
    def getter
        @@class_var
        @a
    end
end
obj1=Parent.new
obj2=Parent.new
obj1.increase
p obj1.getter
p obj2.getter

class Parent
    def a()
    end
end

class Child<Parent
    def a ()
        super()
    end
end

[1,2,3,4,nil, nil, '',  5, [6, nil, '', 7]].flatten.compact.map {|x| x if(x.to_i%2!=0)}.compact
[1,nil,3,nil,nil,5,nil,nil,7]

[1,2,3,4,nil, nil, '',  5, [6, nil, '', 7]].flatten.compact.select {|x| x.to_i.odd?}
print a => Apekshit
p a => Adarsh (inspect)
puts A => Amit (to_s)
p A => Vinsol

class A
 def inspect
    "Adarsh"
 end
 def to_s
    "Apekshit"
 end
 def self.to_s
    "Amit"
 end
 def self.inspect
    "Vinsol"
 end
end

A.new(3) + A.new(5) => 15

class A
    attr_accessor :var
    def initialize (n)
        @var=n
    end
    def +(obj)
        @var*obj.var
    end

end

h={}
h=Hash.new([])
h=Hash.new {|hash,key| hash[key] = [] }




a = [1,2,3,4]

b = a.each {|a| a }

=> a=[1,2,3,4]
=> b=[1,2,3,4]

a = [1,2,3,4]

b = a.each! {|a| a }

=> a=[1,2,3,4]
=> error

a = [1,2,3,4]

b = a.map {|a| a/2 }

=> a=[1,2,3,4]
=> b=[0,1,1,2]

a = [1,2,3,4]

b = a.map! {|a| a/2 }
=> a=[0,1,1,2]
=> b=[0,1,1,2]

a = [1,2,3,4]

b = a.select {|a| a }

=>a=[1,2,3,4]
=>b=[1,2,3,4]

a = [1,2,3,4]

b = a.select! {|a| a }

=>a=[1,2,3,4]
=>b=[1,2,3,4]

a = [1,2,3,4]

b = a.collect {|a| a }



a = [1,2,3,4]

b = a.collect! {|a| a }

a = [1,2,3,4]

b = a.reject {|a| a }

=>a=[1,2,3,4]
=>b=[]

a = [1,2,3,4]

b = a.reject! {|a| a }

=>a=[]
=>b=[]

a = [1,2,3,4]

b = a.find {|a| a }

=>a=[1,2,3,4]
=>b = 1

a = [1,2,3,4]

b = a.find! {|a| a }
=>a=[1,2,3,4]
=>error
[1].any? {},=>false 
[1].all? {}, =>false
[1].none? {}, true
[nil].any? {}, false 
[nil].all? {}, false
[nil].none? {} true

(1..10).to_a
[]<<eleme