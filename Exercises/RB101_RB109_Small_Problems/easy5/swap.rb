# def swap(string)
#   string.split.map do |word|
#     if word.size == 1
#       word
#     else
#       word_dup = word
#       first, last = word_dup.slice!(0), word_dup.slice!(-1)
    
#       word_dup.insert(0, last) << first
#     end
#   end.join(' ')
# end


# Solution.  Alternative.
def swap(string)
  string.split.map do |word|
    char1 = word[0]

    if word.size == 1
      word
    else
      word.sub!(word[0], word[-1])[-1] = char1
      word
    end
  end.join(' ')
end
