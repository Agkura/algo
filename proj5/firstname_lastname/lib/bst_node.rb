class BSTNode
  attr_accessor :right, :left, :parent
  attr_reader :value

  def initialize(value)
    @right, @left, @parent = nil, nil, nil
    @value = value
  end

  def right_empty?
    right.nil?
  end

  def left_empty?
    left.nil?
  end

end
