birds = %w(raven finch hawk eagle)

# def group_type(arr)
#   type1, type2, *type3 = arr
#   yield(type1, type2, type3)
# end

# group_type(birds) { |_, _, birds| p birds }

def group_type(arr)
  yield arr
end

group_type(birds) { |_, _, *birds| p birds }
