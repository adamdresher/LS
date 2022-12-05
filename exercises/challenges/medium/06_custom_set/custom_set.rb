class CustomSet
  def initialize(arr=[])
    @set = arr.uniq.sort
  end

  def empty?
    set.empty?
  end

  def contains?(obj)
    set.include? obj
  end

  def subset?(other)
    set.all? { |obj| other.contains? obj }
  end

  def disjoint?(other)
    set.none? { |obj| other.contains? obj }
  end

  def eql?(other)
    set == other.set
  end

  def add(obj)
    self.set = set.push(obj).uniq.sort
    self
  end

  def intersection(other)
    elements = set.select { |obj| other.set.include? obj }
    CustomSet.new(elements)
  end

  def difference(other)
    elements = set.reject { |obj| other.set.include? obj }
    CustomSet.new(elements)
  end

  def union(other)
    elements = set + other.set
    CustomSet.new(elements)
  end

  def ==(other)
    set === other.set
  end

  protected

  attr_accessor :set
end
