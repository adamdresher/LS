class PerfectNumber
  class << self
  # defining `class << self` here essentially instantiates a class object from
  # self
  # as a result, all methods defined within this class block are class instance
  # methods
  # this makes them available to the public interface as class methods without
  # defining `self` in the method definition's name
  # this also makes it possible to define private class methods
    def classify(natural_num)
      unless natural_num.is_a?(Integer) && natural_num > 0
        raise UnnaturalNumberError.new("#{natural_num} is not a natural number")
      end

      @natural_num = natural_num

      case aliquot_sum
      when natural_num   then 'perfect'
      when natural_num.. then 'abundant'
      else                    'deficient'
      end
    end

  private
  # although `private` is used above, defining `aliquot_sum` as a class method
  # allows it accessible to the public interface
  # defining `aliquot_sum` a instance method allows it to become a private
  # method
    def aliquot_sum
      (1..@natural_num/2).select { |num| @natural_num % num == 0 }.sum
    end
  end
end

class UnnaturalNumberError < StandardError ; end
