# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = BSTNode.new(value) if root.nil?
    self.class.insert(value, root)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.value == nil
    return tree_node if value == tree_node.value
    
    if value <= tree_node.value
      find(value, tree_node.left) unless tree_node.left_empty?
    elsif value > tree_node.value
      find(value, tree_node.right) unless tree_node.right_empty?
    end
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def self.insert(value, tree_node)
    if value <= tree_node.value && tree_node.left_empty?
      new_node = BSTNode.new(value)
      tree_node.left, new_node.parent = new_node, tree_node
    elsif value > tree_node.value && tree_node.right_empty?
      new_node = BSTNode.new(value)
      tree_node.right, new_node = new_node, tree_node
    elsif value <= tree_node.value
      BinarySearchTree.insert(value, tree_node.left)
    else
      BinarySearchTree.insert(value, tree_node.right)
    end
  end

end
