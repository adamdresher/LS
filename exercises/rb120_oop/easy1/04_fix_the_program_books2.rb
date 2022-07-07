class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
# => 'The author of "Snow Crash" is Neil Stephenson.'
puts %(book = #{book}.)
# => 'book = "Snow Crash", by Neil Stephenson.'
=begin
By separating the assignment of author and title into two unique steps, there is
a clear benefit and drawback.  On one hand, it would be possible to assign 
multiple books their author or title at once (for example if all the books are 
from the same author.  On the other hand, it might be easier to assign both 
author and title at the same time (as is typical convention).
=end
