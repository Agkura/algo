class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc ? prc : Proc.new { |a, b| a <=> b }
    @store = Array.new
    @count = -1
  end

  def count
    @count
  end

  def extract
    raise "empty" if @store.empty?
    return @store.pop if @store.length == 1
    @store[0], @store[-1] = @store[-1], @store[0]
    val = @store.pop
    @store = BinaryMinHeap.heapify_down(@store, 0)
    val
  end

  def peek
    @store.first
  end

  def push(val)
    @store.push(val)
    @count += 1
    @store = BinaryMinHeap.heapify_up(@store, @count)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    left, right = ((2 * parent_index) + 1), ((2 * parent_index) + 2)
    children << left if left <= ( len - 1 )
    children << right if right <= ( len - 1 )
    children
  end

  def self.parent_index(child_index)
     raise "root has no parent" if child_index == 0
     (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    block = block_given? ? prc : Proc.new { |a,b| a <=> b }
    incomplete_heap = true
    while incomplete_heap
      incomplete_heap = false
      chidx = BinaryMinHeap.child_indices(len, parent_idx)
      if chidx.length == 2
        chidx =  block.call(array[chidx[1]],array[chidx[0]]) == 1 ? chidx[0] : chidx[1]
      else
        chidx = chidx[0]
      end
      if chidx && block.call(array[parent_idx], array[chidx]) == 1
        array[parent_idx], array[chidx] = array[chidx], array[parent_idx]
        parent_idx = chidx
        incomplete_heap = true
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    block = block_given? ? prc : Proc.new { |a,b| a <=> b }
    incomplete_heap = true
    while incomplete_heap
      incomplete_heap = false
      parent_idx = child_idx == 0 ? nil : BinaryMinHeap.parent_index(child_idx)
      if parent_idx && block.call(array[parent_idx], array[child_idx]) == 1
        array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
        child_idx = parent_idx
        incomplete_heap = true unless child_idx == 0
      end
    end
    array
  end

  private
  attr_reader :count
end
