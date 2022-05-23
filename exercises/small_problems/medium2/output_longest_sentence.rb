# f = File.readlines('four_score.txt', '.')

# f.each do |sentence|
#   puts sentence
#   puts "\n"
# end

sentences = []

File.foreach('four_score.txt', '.') do |sentence|
  sentence.gsub!(/\n/, ' ').strip!
  sentences << sentence
end

sentences.sort! { |a, b| b.split.count <=> a.split.count }
largest_sentence = sentences.first
word_count = largest_sentence.split.count
puts "This following line is #{word_count} words long:"
puts
puts largest_sentence
