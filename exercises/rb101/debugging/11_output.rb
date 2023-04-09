arr = ["9", "8", "7", "10", "11"]
# p is returning the enumerator returned by sort without its block argument
# p arr.sort do |x, y| # sort is not bound as tightly to its block as it is to p
#     y.to_i <=> x.to_i
#   end
  p (arr.sort do |x, y| # parantheses can explicitly state binding
    y.to_i <=> x.to_i
  end)
  p arr.sort { |x, y| y.to_i <=> x.to_i } # {} binds tighter than do..end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 
