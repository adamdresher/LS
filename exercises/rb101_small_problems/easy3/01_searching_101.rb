ORDINALS = ['1st', '2nd', '3rd', '4th', '5th', 'last']

def prompt(message)
  Kernel.puts("==> #{message}")
end

checklist = []

6.times do |num|
  loop do
    prompt("Enter the #{ORDINALS[num]} number:")
    number = gets.chomp
    if number.to_i.to_s == number || number.dup.chars.all? == '0'
      checklist << number.to_i
      break
    else
      prompt("That's not a valid input.")
    end
  end
end

target = checklist.pop
if checklist.include?(target)
  prompt("The number #{target} appears in your list: #{checklist}.")
else
  prompt("The number #{target} does not appear in your list: #{checklist}.")
end

# # Example input:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17

# # Output:
# The number 17 appears in [25, 15, 20, 17, 23].

# # Example input:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18

# # Output:
# The number 18 does not appear in [25, 15, 20, 17, 23].
