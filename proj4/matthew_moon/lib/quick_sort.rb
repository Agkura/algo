class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    pivot_idx = QuickSort.partition(array, start, array.length)
    right = QuickSort.sort2!(array, pivot_idx, array.length - pivot_idx)
    left = QuickSort.sort2!(array, 0, pivot_idx)
    return left + right
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { | a, b | a <=> b }
    pivot_idx = start
    bound = start

    ((start + 1)..(start+length-1)).to_a.each do | idx |
      if prc.call(array[start], array[idx]) == 1 && idx - bound >= 1
        array[idx], array[bound + 1] = array[bound + 1], array[idx]
        bound += 1
      elsif prc.call(array[start], array[idx]) == 1
        bound += 1
      end
    end
    array[start], array[bound] = array[bound], array[start]
    start = bound
  end
end
