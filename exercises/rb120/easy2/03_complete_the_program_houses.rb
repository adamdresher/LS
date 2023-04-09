class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=> other
    @price <=> other.price
  end
end

puts home1 = House.new(100_000)
puts home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1
=begin
The use of price to compare House objects is reasonable.  However when 
considering all the attributes / states a house might have, using price as a 
vehicle for comparison is limiting.  In another context, houses might be 
compared based on their relative safety, their sq ft, how new they are, energy 
efficiency, etc.  Because there are so many attributes of houses, default 
comparison as presented could result in unexpected errors in client-side code 
where the metrics for comparison aren't obvious.
=end
