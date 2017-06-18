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
    target_node = find(value)
    return nil if target_node.nil?
    if target_node.childless?
      if target_node.parent.nil?
        @root = nil
      else
        new_parent_pointer(target_node)
      end
    elsif target_node.right_empty?
      if target_node.parent.nil?
        @root = target_node.left
        target_node.left.parent, target_node.left = nil, nil
      else
        new_parent_pointer(target_node, target_node.left)
      end
    elsif target_node.left_empty?
      if target_node.parent.nil?
        @root = target_node.right
        target_node.right.parent, target_node.right = nil, nil
      else
        new_parent_pointer(target_node, target_node.right)
      end
    else
      swap_with_maximum(target_node)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right_empty?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 unless tree_node && (tree_node.left || tree_node.right)
    left = 1 + depth(tree_node.left)
    right = 1 + depth(tree_node.right)
    left > right ? left : right
  end

  def is_balanced?(tree_node = @root)
    left = tree_node.left ? depth(tree_node.left) : 0
    right = tree_node.right ? depth(tree_node.right) : 0

    left_balance = tree_node.left ? is_balanced?(tree_node.left) : true
    right_balance = tree_node.right ? is_balanced?(tree_node.right) : true

    balanced = left_balance && right_balance
    diff = (left - right)

    if diff.abs <= 1 && balanced
      return true
    else
      return false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    left = tree_node && tree_node.left ? in_order_traversal(tree_node.left) : []
    right = tree_node && tree_node.right ? in_order_traversal(tree_node.right) : []
    center = tree_node ? tree_node.value : []
    left + [center] + right
  end


  private
  # optional helper methods go here:

  def self.insert(value, tree_node)
    if value <= tree_node.value && tree_node.left_empty?
      new_node = BSTNode.new(value)
      tree_node.left, new_node.parent = new_node, tree_node
    elsif value > tree_node.value && tree_node.right_empty?
      new_node = BSTNode.new(value)
      tree_node.right, new_node.parent = new_node, tree_node
    elsif value <= tree_node.value
      BinarySearchTree.insert(value, tree_node.left)
    else
      BinarySearchTree.insert(value, tree_node.right)
    end
  end

  def new_parent_pointer(target_node, new_node = nil)
    if target_node.parent.right == target_node
      target_node.parent.right = new_node
      new_node.parent = target_node.parent unless new_node.nil?
    else
      target_node.parent.left = new_node
      new_node.parent = target_node.parent unless new_node.nil?
    end
    target_node.parent, target_node.right, target_node.left = nil, nil, nil
  end

  def swap_with_maximum(target_node)
    swap_node = maximum(target_node.left)
    if target_node.parent
      new_parent_pointer(swap_node, swap_node.left) unless swap_node.left_empty?
      new_parent_pointer(target_node, swap_node)
      swap_node.parent.right = nil
      swap_node.left, swap_node.right = target_node.left, target_node.right
    else
      @root = swap_node
      swap_node.parent = nil
      swap_node.parent.right = nil
      swap_node.left, swap_node.right = target_node.left, target_node.right
    end
  end
end
