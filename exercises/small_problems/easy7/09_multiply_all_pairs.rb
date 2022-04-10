# frozen_string_literal: true

def multiply_all_pairs(arr1, arr2)
  all_pairs = list_combinations(arr1, arr2)
  all_pairs.map! { |arr| arr.reduce(:*) }.sort
end

def list_combinations(arr1, arr2)
  all_pairs = []
  arr1.each do |arr1_num|
    arr2.each { |arr2_num| all_pairs << [arr1_num, arr2_num] }
  end
  all_pairs
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
