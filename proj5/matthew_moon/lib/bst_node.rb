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

  def has_1_child
    right_empty? || left_empty?
  end

  def childless?
    right_empty? && left_empty?
  end
end
