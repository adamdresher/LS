# cumbersome solution
class SumOfMultiples
  @@factors = [3, 5]

  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    find_sum(@@factors, limit)
  end

  def to(limit)
    # self.class.to(limit)
    self.class.find_sum(@factors, limit)
  end

  class << self

  # private
  # making this method private results in SumOfMultiples#to not having access

    def find_sum(list, limit)
      multiples = []

      list.each do |factor|
        factor_multiplied = factor

        while factor_multiplied < limit
          # p multiples
          multiples << factor_multiplied
          factor_multiplied += factor
        end
      end

      multiples.uniq.sum
    end
  end
end

# not working yet, but this was my original approach
# class SumOfMultiples
#   @@factors = [3, 5]

#   def initialize(*factors)
#     @factors = factors
#   end

#   def to(limit)
#     self.class.to(limit)
#   end

#   def self.to(limit)
#     multiples = []

#     factors = @factors ? @factors : @@factors # issue here

#     factors.each do |factor|
#       factor_multiplied = factor

#       while factor_multiplied < limit
#         # p multiples
#         multiples << factor_multiplied
#         factor_multiplied += factor
#       end
#     end

#     multiples.uniq.sum
#   end
# end
