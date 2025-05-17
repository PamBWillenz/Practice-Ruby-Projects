require_relative 'binary_search_tree'

array = Array.new(15) { rand(1..100) }
puts "Random array: #{array.inspect}"

tree = Tree.new
tree.build_tree(array)
puts "Level order traversal of the tree: #{tree.level_order.inspect}"
puts "Is the tree balanced? #{tree.balanced?}"

puts "Preorder traversal: #{tree.preorder.inspect}"
puts "Postorder traversal: #{tree.postorder.inspect}"
puts "Inorder traversal: #{tree.inorder.inspect}"

# Unbalance the tree by adding several numbers > 100
[150, 200, 250, 300, 350].each do |num|
  tree.insert(num)
end

puts "After inserting values > 100 to unbalance:"
puts "Level order traversal: #{tree.level_order.inspect}"
puts "Is the tree balanced? #{tree.balanced?}"

tree.rebalance

puts "After rebalancing:"
puts "Level order traversal: #{tree.level_order.inspect}"
puts "Is the tree balanced? #{tree.balanced?}"
puts "Preorder traversal: #{tree.preorder.inspect}"
puts "Postorder traversal: #{tree.postorder.inspect}"
puts "Inorder traversal: #{tree.inorder.inspect}"
