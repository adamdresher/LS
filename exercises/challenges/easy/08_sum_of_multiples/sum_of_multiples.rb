class SumOfMultiples
  @@factors = [3, 5]

  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit, factors=@@factors)
    factors.each_with_object([]) do |factor, multiples|
      current_factor = factor

      while current_factor < limit
        multiples << current_factor
        current_factor += factor
      end
    end.uniq.sum
  end

  def to(limit)
    self.class.to(limit, @factors)
  end
end

# # cumbersome solution
# class SumOfMultiples
#   @@factors = [3, 5]

#   def initialize(*factors)
#     @factors = factors
#   end

#   def self.to(limit)
#     find_sum(@@factors, limit)
#   end

#   def to(limit)
#     # self.class.to(limit)
#     self.class.find_sum(@factors, limit)
#   end

#   class << self

#   # private
#   # making this method private results in SumOfMultiples#to not having access

#     def find_sum(list, limit)
#       multiples = []

#       list.each do |factor|
#         factor_multiplied = factor

#         while factor_multiplied < limit
#           multiples << factor_multiplied
#           factor_multiplied += factor
#         end
#       end

#       multiples.uniq.sum
#     end
#   end
# end

