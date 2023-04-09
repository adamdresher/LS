=begin
Problem

Create a class that defines an ordered list (like an Array).  The list has a
fixed number of spaces (defined during initialization).  Newly initialized lists
start with spaces having `nil` values.  Adding a new item to the list means
replacing the value of the most recently referenced index (starting with 0).
Removing an item from the lisst means replacing the value of the item before the
most recent item.  The new value is `nil`.

--------------------------------------------------------------------------------

Breakdown of tests:

- initialize
  - assign 0 to oldest_object_index
- add 1 to index 0
- add 2 to index 1
- remove 1 from index 0
  - add nil to index 0
  - assign 1 to oldest_object_index
- add 3 to index 2
- add 4 to index 0
- remove 2 from index 1
  - add nil to index 1
  - assign 2 to oldest_object_index
- add 5 to index 1
- add 6 to index 2
  - replace 3 at index 2
  - assign 0 to oldest_object_index
- add 7 to index 0
  - replace 4 at index 0
  - assign 1 to oldest_object_index
- remove 5 from index 1
  - add nil to index 1
  - assign 2 to oldest_object_index
- remove 6 from index 2
  - add nil to index 2
  - assign 0 to oldest_object_index
- remove 7 from index 0
  - add nil to index 0
  - assign 1 to oldest_object_index

--------------------------------------------------------------------------------

Algorithm:

initialize with buffer size
- initialize a buffer to an Array object
- initialize a variable to track current index
- initialize a variable to track old element's index

- oldest object index

add an object at current index
- unless current index contains nil
  - remove oldest object in buffer and reassign oldest objectindex += 1
- assign object to current index
- increment index + 1

remove oldest object in buffer
- remove oldest object in buffer based on oldest object index
- reassign oldest object index to current index + 1
=end

class CircularQueue
  def initialize(length)
    @buffer = Array.new(length)
    @oldest_idx = 0
    @write_idx = 0
  end

  def enqueue(value)
    dequeue unless buffer[write_idx].nil?

    self.buffer[write_idx] = value
    next_write_idx
  end

  def dequeue
    oldest_value = buffer[oldest_idx]

    
    self.buffer[oldest_idx] = nil
    next_oldest_idx unless oldest_value.nil?

    oldest_value
  end

  private

  attr_accessor :buffer, :oldest_idx, :write_idx

  def next_oldest_idx
    self.oldest_idx = format_num(oldest_idx)
  end

  def next_write_idx
    self.write_idx = format_num(write_idx)
  end

  def format_num(type)
    (type + 1) % buffer.size
  end
end

# tests
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
