def shout_out_to(name)
  # chars is returning a new Array instead of mutating its caller
  # name.chars.each { |c| c.upcase! }
  name = name.chars.each { |c| c.upcase! }.join
  # name.upcase! # more concise

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
