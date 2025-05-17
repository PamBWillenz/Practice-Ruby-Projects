class Node
  
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(array)
    array = array.uniq.sort
    @root = build_tree_recursive(array)
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
      return
    end
    current = @root
    parent = nil
    while current
      parent = current
      if value < current.value
        current = current.left
      elsif value > current.value
        current = current.right
      else
        return # Value already exists, do nothing
      end
    end
    if value < parent.value
      parent.left = Node.new(value)
    else
      parent.right = Node.new(value)
    end
  end

  def delete(value)
    @root = delete_iterative(@root, value)
  end

  def find(value)
    current = @root
    while current
      return current if current.value == value
      current = value < current.value ? current.left : current.right
    end
    nil
  end

  def level_order
    return [] if @root.nil?
    queue = [@root]
    result = []
    until queue.empty?
      node = queue.shift
      if block_given?
        yield node
      else
        result << node.value
      end
      queue << node.left if node.left
      queue << node.right if node.right
    end
    block_given? ? nil : result
  end

  def inorder(&block)
    result = []
    inorder_recursive(@root, result, &block)
    block_given? ? nil : result
  end

  def preorder(&block)
    result = []
    preorder_recursive(@root, result, &block)
    block_given? ? nil : result
  end

  def postorder(&block)
    result = []
    postorder_recursive(@root, result, &block)
    block_given? ? nil : result
  end

  def height(value)
    node = find(value)
    return nil unless node
    height_recursive(node)
  end

  def depth(value)
    depth_recursive(@root, value, 0)
  end

  def balanced?
    balanced_recursive(@root)
  end

  def rebalance
    values = level_order
    build_tree(values)
  end

  private

  def build_tree_recursive(array)
    return nil if array.empty?
    mid = array.length / 2
    node = Node.new(array[mid])
    node.left = build_tree_recursive(array[0...mid])
    node.right = build_tree_recursive(array[(mid + 1)..-1])
    node
  end

  def delete_iterative(node, value)
    parent = nil
    current = node
    while current && current.value != value
      parent = current
      if value < current.value
        current = current.left
      else
        current = current.right
      end
    end
    return node if current.nil? # Value not found

    # Node with only one child or no child
    if current.left.nil?
      child = current.right
    elsif current.right.nil?
      child = current.left
    else
      # Node with two children: find inorder successor
      succ_parent = current
      succ = current.right
      while succ.left
        succ_parent = succ
        succ = succ.left
      end
      current.value = succ.value
      # Delete successor node
      if succ_parent.left == succ
        succ_parent.left = succ.right
      else
        succ_parent.right = succ.right
      end
      return node
    end

    if parent.nil?
      return child # Deleted node was root
    elsif parent.left == current
      parent.left = child
    else
      parent.right = child
    end
    node
  end

  def inorder_recursive(node, result, &block)
    return if node.nil?
    inorder_recursive(node.left, result, &block)
    block_given? ? yield(node) : result << node.value
    inorder_recursive(node.right, result, &block)
  end

  def preorder_recursive(node, result, &block)
    return if node.nil?
    block_given? ? yield(node) : result << node.value
    preorder_recursive(node.left, result, &block)
    preorder_recursive(node.right, result, &block)
  end

  def postorder_recursive(node, result, &block)
    return if node.nil?
    postorder_recursive(node.left, result, &block)
    postorder_recursive(node.right, result, &block)
    block_given? ? yield(node) : result << node.value
  end

  def height_recursive(node)
    return -1 if node.nil?
    1 + [height_recursive(node.left), height_recursive(node.right)].max
  end

  def depth_recursive(node, value, depth)
    return nil if node.nil?
    return depth if node.value == value
    if value < node.value
      depth_recursive(node.left, value, depth + 1)
    else
      depth_recursive(node.right, value, depth + 1)
    end
  end

  def balanced_recursive(node)
    return true if node.nil?
    lh = height_recursive(node.left)
    rh = height_recursive(node.right)
    (lh - rh).abs <= 1 && balanced_recursive(node.left) && balanced_recursive(node.right)
  end

end