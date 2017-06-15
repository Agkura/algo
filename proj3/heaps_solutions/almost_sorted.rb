## Almost sorted

# Timestamped data may not always make it into the database in the
# perfect order. Server loads, network routes, etc. Your job is to
# take in a very long sequence of numbers in real-time and efficiently
# print it out in the correct order. Each number is, at most, `k` away
# from its final sorted position. Target time complexity is `O(nlogk)`
# and target space is `O(k)`.

require_relative 'heap'

def almost_sorted(arr, k)
  stream = BinaryMinHeap.new
  out = []
  until arr.empty?
    out.push(stream.extract) if stream.count == k
    stream.push(arr.take(1))
  end
  out
end

# fix, do it until heap is empty not just array
