=begin
class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post
# =end

=begin
A `NameError` `Exception` is raised when `puts` is called on line 43.  This is due to the
implementation of `File#to_s` referencing the constant `FORMAT`.  Constants use
lexical scope, therefore `FORMAT` is looked for within `File`, then up the
method lookup path.  However `Format` is defined within the subclasses of
`File`.
To resolve this issue, `File#to_s` could be redefined to use the expression,
`self.class::FORMAT`.  This takes advantage of the namespacing operator to
first search the caller's class definition for `FORMAT`.
=end

class File

  # ...

  def to_s
    "#{name}.#{FORMAT}"
  end
end
