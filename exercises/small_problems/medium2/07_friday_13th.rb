# Problem:
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# Input: An Integer (year)
# Return: An Integer (number of occurances)
# Goal: Determine the number of times Friday the 13th occurs within the argument year
# Rules:
#   year is always above 1752 (Time and Date can be used with default options)
#   week starts on Monday or Sunday? => go with default for now
#   number of occurrances is based on days that are both 13th and Friday
#   Date uses 1..7 to reference days of the week starting with Monday

# Examples:
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# Mental Model:
#   Create a list of all days in the year that are 13.  Select the days that are Friday.  Count how many days are selected.  Return the count.

# Data Structures:
#   [01, 02, 03, ...] => [03] => 1

# Algorithm:
#   create Array every month in a year (01..12)
#     iterate through months of the year
#       create the 13th day to the Array
#   select the days that are Friday (5)
#   return the count of selected days

# Code:

def friday_13th(year)
  require 'Date'

  months = (1..12).to_a

  months.select! do |month|
    day = Date.new(year, month, 13)
    day.cwday == 5 # days of wk are defined 1..7; start on Monday => Friday is 5
  end.count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
