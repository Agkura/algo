class Vertex
  attr_accessor :value, :in_edges, :out_edges

  def initialize(value)
    @in_edges, @out_edges, @value = [], [], value
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :weight, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex, @to_vertex, @cost = from_vertex, to_vertex, cost
    @from_vertex.out_edges.push(self)
    @to_vertex.in_edges.push(self)
  end

  def destroy!
    from_vertex.out_edges.delete(self)
    to_vertex.in_edges.delete(self)
    @to_vertex, @from_vertex = nil, nil
  end
end
