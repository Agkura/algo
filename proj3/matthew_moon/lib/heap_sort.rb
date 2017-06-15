require_relative "heap"

class Array
  def heap_sort!
    partition_end = self.length - 1
    prc = Proc.new { | a,b | b <=> a }
    1.upto(partition_end) do |i|
      BinaryMinHeap.heapify_up(self, i, i + 2, &prc)
    end
    partition_end.downto(1) do |j|
      self[0], self[j] = self[j], self[0]
      BinaryMinHeap.heapify_down(self, 0, j, &prc)
    end
  end
end
