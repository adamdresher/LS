class Car
  attr_accessor :mileage

  def initialize
    @mileage
  end

  def increment_mileage(miles)
    # total = mileage + miles
    # mileage = total # mileage is seen as local variable assignment
    # @mileage += miles # explicitly reassigning the instance variable
    self.mileage += miles # referencing the instantiated object to call mileage
    # implementing the method mileage rather than instance variable allows the 
    # class to control how the method mileage is implemented (eg, formatting arg 
    # into an Integer)
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage # => 5678
