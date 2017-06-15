require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @store = StaticArray.new()
    @capacity = 8
  end

  # O(1)
  def [](index)
    return @store[index] unless index >= @length
    raise "index out of bounds"
  end

  # O(1)
  def []=(index, value)
    if index < @length
      @store[index] = value
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def pop
    if length != 0
      @length -= 1
    else
      raise "index out of bounds"
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length != @capacity
      @length += 1
      @store[@length] = val
    else
      self.resize!
      self.push(val)
    end
  end

  # O(n): has to shift over all the elements.
  def shift
    if length != 0
      @length -= 1
      shifted = @store[0]
      @store = @store.drop(1)
      shifted
    else
      raise "index out of bounds"
    end
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length != @capacity
      @store = [val] + @store
      @length += 1
    else
      self.resize!
      self.unshift(val)
    end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
  end
end
