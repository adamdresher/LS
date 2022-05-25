def output_longest_sentence(filename)
  longest_sentence = determine_longest_sentence(filename)
  word_count = longest_sentence.split.size

  puts "The following sentence has #{word_count} words and is the longest sentence in #{filename}:"
  puts
  puts longest_sentence
end

def determine_longest_sentence(filename)
  longest_sentence = ''
  new_sentence = ''
  lines = []

  File.foreach(filename) do |line| # avoids reading entire file at once
    lines << line.chomp!
    lines = lines.join(' ').strip

    if sentence_found?(lines)
      new_sentence, lines = separate_sentence(lines)
    end

    if new_sentence.split.size > longest_sentence.split.size
      longest_sentence = new_sentence
    end

    lines = [lines]
  end
  longest_sentence
end

def sentence_found?(string)
  string.match?(/\.|\?|\!/)
end

def separate_sentence(string) # returns sentence with ending punctuation
  new_sentence, sentence_builder = case delimiter_type(string)
                                   when '.'
                                   string.split(/\./)
                                   when '!'
                                   string.split(/\!/)
                                   when '?'
                                   string.split(/\?/)
                                   end
  [new_sentence + delimiter_type(string), sentence_builder]
end

def delimiter_type(string)
  if string.match(/\./)
    '.'
  elsif string.match(/\!/)
    '!'
  elsif string.match(/\?/)
    '?'
  end
end

output_longest_sentence('four_score.txt') # => 86 words long ...
output_longest_sentence('shelly_mary_frankenstein.txt') # => 1576 words long ...
