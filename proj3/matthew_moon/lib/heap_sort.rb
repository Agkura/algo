require_relative "heap"

class Array
  def heap_sort!
    partition_end = self.length - 1
    prc = Proc.new { | a,b | b <=> a }
    1.upto(partition_end) do |i|
      self[0..i] = BinaryMinHeap.heapify_up(self[0..i], i, &prc)
    end
    partition_end.downto(1) do |j|
      self[0], self[j] = self[j], self[0]
      self[0..j-1] = BinaryMinHeap.heapify_down(self[0..j-1], 0, &prc)
    end
  end
end
