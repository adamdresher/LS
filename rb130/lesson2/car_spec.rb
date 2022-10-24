# Expectation or spec-style syntax for testing with Minitest
# This is not considered 'normal Ruby' style code
# This is considered DSL (Domain Specific Language) which is more akin to RSpec syntax

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4 # this is the expectation
  end
end
