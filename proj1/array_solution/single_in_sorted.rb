# Given a sorted array consisting of only integers where every
# element appears twice except for one element which appears once.
# Find this single element that appears only once.
# Do it in O(logn) time and O(1) space!
#
def single_in_sorted(arr)
  index = 0
  found = nil
  until found
    if arr[index] !=  arr[index + 1]
      found = arr[index]
    else
      index += 2
    end
  end
  found
end


#check if odd or even before doing search, odd or even midpoint affects it

def single_in_sorted(arr)
  mid = arr.length/2
  return arr[0] if arr.count == 1
  if arr[mid] != arr[mid + 1] && arr[mid] != arr[mid -1]
    return arr[mid]
  elsif arr[mid] != arr[mid + 1]
    single_in_sorted(arr[mid+1..-1])
  else
    single_in_sorted(arr[mid+1..-1])
  end
end
