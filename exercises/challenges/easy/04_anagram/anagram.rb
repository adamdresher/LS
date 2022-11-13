class Anagram
  def initialize(string)
    @subject = string.downcase
  end

  def match(array)
    array.select do |word|
      word = word.downcase
      @subject != word &&
      char_occurrences(@subject) == char_occurrences(word)
    end
  end

  private

  def char_occurrences(word)
    word.chars.tally
  end
end
