class TextAnalyzer
  def initialize
    @path = ask_user_for_file_path
  end

  def process
    file = File.new(@path)
    yield(file.read)
    file.close
  end

  private

  def ask_user_for_file_path
    puts "Please enter the filename and its path:"
    @path = gets.chomp
  end
end

analyzer = TextAnalyzer.new

analyzer.process { |txt| puts "#{txt.split("\n\n").size} paragraphs" }
analyzer.process { |txt| puts "#{txt.split("\n").size} lines" }
analyzer.process { |txt| puts "#{txt.split(" ").size} words" }

# Expected output using '02_sample_text.txt':
# 3 paragraphs
# 15 lines
# 126 words
