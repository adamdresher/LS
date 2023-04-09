require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError ; end

class Employee
  def hire
    raise NoExperienceError, 'No experience found.'
  end
end

class EmployeeTest < Minitest::Test
  def test_hire_raises
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end
