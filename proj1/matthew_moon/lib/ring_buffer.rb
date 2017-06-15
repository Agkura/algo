require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @store = StaticArray.new()
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    return @store[(@start_idx + index) % @capacity] unless index >= @length
    raise "index out of bounds"
  end

  # O(1)
  def []=(index, val)
    if index <= @capacity && index >= 0
      @store[index] = val
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def pop
    if length != 0
      @length -= 1
      @store[(@start_idx + @length) % @capacity]
    else
      raise "index out of bounds"
    end
  end

  # O(1) ammortized
  def push(val)
    if @length != @capacity
      self[(@start_idx + @length) % @capacity] = val
      @length += 1
    else
      self.resize!
      self.push(val)
    end
  end

  # O(1)
  def shift
    if length != 0
      @length -= 1
      shifted = @store[@start_idx]
      @start_idx = (@start_idx + 1) % @capacity
      shifted
    else
      raise "index out of bounds"
    end
  end

  # O(1) ammortized
  def unshift(val)
    if @length != @capacity
      @start_idx = @start_idx == 0 ? @capacity - 1: @start_idx - 1
      self[@start_idx] = val
      @length += 1
    else
      self.resize!
      self.unshift(val)
    end
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    hold =
    (@start_idx...(@length + @start_idx)).each do |int|
      if int < @capacity
        hold.push(@store[int])
      else
        hold.push(@store[int % @capacity])
      end
    end
    @start_idx = 0
    @capacity *= 2
    @store = hold
  end
end
