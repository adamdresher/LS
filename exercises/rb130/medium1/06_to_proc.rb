# # Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   # n.method_name.method_name
#   a_proc.call(n)
# end

# # Replace `argument` with the correct argument below
# # `method` is `Object#method`, not a placeholder
# # base8_proc = method(argument).to_proc
# base8_proc = method(&convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work
# # Replace `a_proc` with the correct object
# a_proc = proc { "#{n / 7}#{n % 7}".to_i }
# p [8, 10, 12, 14, 16, 33].map(&a_proc) == [10, 12, 14, 16, 20, 41]

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  # n.method_name.method_name
  "#{n / 8}#{n % 8}".to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
# base8_proc = method(argument).to_proc
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]
