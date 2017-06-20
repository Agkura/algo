# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'graph'
require 'topological_sort'

def install_order(arr)
  hashed = {}
  arr.each do | tuple |
    hashed[tuple[0]] = Vertex.new(tuple[0]) unless hashed[tuple[0]]
    hashed[tuple[1]] = Vertex.new(tuple[1]) unless hashed[tuple[1]]
    Edge.new(hashed[tuple[1]], hashed[tuple[0]])
  end
  (1..hashed.keys.max).to_a.each { | id | hashed[id] = Vertex.new(id) unless hashed[id] }
  topological_sort(hashed.values).map { |vert| vert.value }
end
