def mahna_mahna
  puts "dut doooo do do do..."
  puts "dut do do dooo..."
  puts "dut doooo do do do..."
  puts "dut do do dooo..."
  puts "dut doooo do do do,"
  puts "do do dooo,"
  puts "do do dooo,"
  puts "do do dooo dut dut dooo dooo do do doooo."
  puts "MANHA MANHA!"
  puts " "
end

puts " "
puts "This is going to annoy the heck outta ya, but there's this Sesame Street song that makes me smile.."
puts "Just say 'STOP' if this is getting annoying."
puts "Ready?"
the_end = gets.chomp.to_s
puts " "

while the_end != "STOP"
  2.times {mahna_mahna}
  puts "Okay... remember 'STOP' is the magic word."
  puts "Had enough?"
  the_end = gets.chomp.to_s
  2.times {puts " "}
end