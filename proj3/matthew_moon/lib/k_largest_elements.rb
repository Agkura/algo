require_relative 'heap'

def k_largest_elements(array, k)
  1.upto(array.length-1) do |i|
    array[0..i] = BinaryMinHeap.heapify_up(array[0..i], i)
  end
  (array.length-1).downto(1) do |j|
    array[0], array[j] = array[j], array[0]
    array[0..j-1] = BinaryMinHeap.heapify_down(array[0..j-1], 0)
  end
  return array[0..k-1]
end
