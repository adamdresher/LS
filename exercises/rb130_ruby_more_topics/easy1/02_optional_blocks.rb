# Optional block without an explicit argument
def compute
  return yield if block_given?
  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
# Optional block with an explicit argument
def compute(arg)
  return yield(arg) if block_given?
  'Does not compute.'
end

p compute(2) { |num| 'Wubba lubba' + (' dub' * num) + '!' } == 'Wubba lubba dub dub!'
p compute('Chia') { |word| (word[0, 2] + ' ') * 3 + word + '!' } == 'Ch Ch Ch Chia!'
p compute('Arg is ignored') == 'Does not compute.'
