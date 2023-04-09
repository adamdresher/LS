class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color # (NoMethodError)

=begin
method lookup path for #color:
Cat
Animal
Object
Kernel
BasicObject
=end
