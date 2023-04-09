class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = "Huh, oh yeah.  My pin is tw-aaait a minute!  That's a secret!"
puts person1.secret
