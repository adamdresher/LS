# Assertion or assert-style syntax for testing with Minitest
# This is considered 'normal Ruby' style code

require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'
# require_relative 'car.rb' # referencing the file w or wo the file extension is accepted

class CarTest < Minitest::Test
# class CarTest < Minitest::Test # The 't' in 'MiniTest' class is not case sensitive
  def setup
    @car = Car.new
  end
  
  def test_wheels
    assert_equal(4, @car.wheels)
  end

  # def test_bad_wheels
  #   skip #('custom message passed to the skip keyword')
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  # def test_transmission
  #   skip('custom message passed to the skip keyword')
  #   car = Car.new
  #   assert_equal('manual', car.transmission)
  # end

  def test_car_exists
    assert(@car)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) { Car.new('Mustang') }
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = []
    arr << @car
    assert_includes(arr, @car)
  end
end
