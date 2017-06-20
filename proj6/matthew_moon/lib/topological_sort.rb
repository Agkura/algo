require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Khan
def topological_sort(vertices)
  sorted = []
  top_look = []
  vertices.each { |vertex| top_look.push(vertex) if vertex.in_edges.empty? }
  until top_look.empty?
    current_node = top_look.shift
    current_node.out_edges.each do |out_edge|
      top_look.push(out_edge.to_vertex) if out_edge.to_vertex.in_edges.count == 1
    end
    current_node.out_edges.each { |edge| edge.destroy! }
    sorted.push(current_node)
  end
  sorted.length == vertices.length ?  sorted :  []
end


# Tarjan
# def topological_sort(vertices)
#   hash = {}
#   sorted = []
#   vertices.each do |vertex|
#     visited(vertex, hash, sorted)
#     sorted.push(vertex)
#   end
#   sorted.length == vertices.length ? sorted : []
# end
#
# def visited(vertex, hash = {}, sorted = [])
#   if vertex.out_edges.empty?
#     sorted.push(vertex) unless hash[vertex]
#   else
#     vertex.out_edges.each do | edge |
#       if hash[vertex].nil?
#         hash[vertex] = true
#         visited(edge.to_vertex, hash)
#       else
#         sorted.push(vertex)
#       end
#     end
#   end
# end
