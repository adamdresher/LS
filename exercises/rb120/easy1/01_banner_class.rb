class Banner
  def initialize(message, width=message.size)
    @message = message
    @width = width <= MAX_WIDTH ? width : MAX_WIDTH
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    
  end

  private
  MAX_WIDTH = 76

  def limit_message_length
    formatted_message = @message.empty? ? [''] : []
    words = @message.split
    line = ''
    
    words.each_with_index do |word, idx|
      if (line.size + word.size + 1) > @width
        formatted_message << line.strip
        line = word
      else
        line << " #{word}"
      end
      
      formatted_message << line.strip if idx == words.size - 1
    end
  formatted_message
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    limit_message_length.map do |msg|
      ["| #{msg.center(@width)} |"]
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('To boldly go where no one has gone before.', 13)
puts banner
# +---------------+
# |               |
# | To boldly go  |
# | where no one  |
# |   has gone    |
# |    before.    |
# |               |
# +---------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new("Our solution simply adds an instance variable where we store the message that will be bannerized, and then fills out the empty_line and horizontal_rule methods for constructing the first, second, fourth, and fifth lines of the banner. The only tricky part in these two methods is remembering to allow for extra characters to the left and right so everything is aligned.", 40)
puts banner
