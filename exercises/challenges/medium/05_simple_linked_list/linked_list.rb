class Element
  attr_reader :datum, :next

  def initialize(value, next_element=nil)
    @datum = value
    @next = next_element
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def self.from_a(obj)
    obj = [] if obj.nil?

    new_list = SimpleLinkedList.new
    obj.reverse_each { |value| new_list.push value }
    new_list
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(element)
    list.append(Element.new(element, head))
  end

  def head
    list.last
  end

  def peek
    empty? ? nil : head.datum
  end

  def pop
    list.pop.datum
  end

  def to_a
    list.reverse.map(&:datum)
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    list.reverse_each { |element| reversed_list.push element.datum }

    reversed_list
  end

  private

  attr_accessor :list
end
