# In this version of the problem, all packages will be listed, including
# independent ones (independant packages have nil or no value for their
# dependencies), but the package ids may not be numbers.
require_relative 'graph'
require_relative 'topological_sort'

def install_order2(arr)
  hashed = {}
  arr.each do | tuple |
    hashed[tuple[0]] = Vertex.new(tuple[0]) unless hashed[tuple[0]]
    hashed[tuple[1]] = Vertex.new(tuple[1]) unless hashed[tuple[1]]
    Edge.new(hashed[tuple[1]], hashed[tuple[0]])
  end
  topological_sort(hashed.values).map { |vert| vert.value }.compact
end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b'], ['e', 'd']]

p install_order2(arr)
p install_order2(arr2)
