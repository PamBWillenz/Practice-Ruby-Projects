def knight_moves(start, target)
  moves = [
    [2, 1], [1, 2], [-1, 2], [-2, 1],
    [-2, -1], [-1, -2], [1, -2], [2, -1]
  ]
  board_size = 8
  queue = [[start, [start]]]
  visited = Array.new(board_size) { Array.new(board_size, false) }
  visited[start[0]][start[1]] = true

  until queue.empty?
    current_pos, path = queue.shift
    return path if current_pos == target

    moves.each do |dx, dy|
      nx, ny = current_pos[0] + dx, current_pos[1] + dy
      if nx.between?(0, board_size - 1) && ny.between?(0, board_size - 1) && !visited[nx][ny]
        visited[nx][ny] = true
        queue << [[nx, ny], path + [[nx, ny]]]
      end
    end
  end
  nil # If no path found (shouldn't happen on a standard board)
end

# Example usage and simple tests
if __FILE__ == $0
  puts "Test 1: knight_moves([0,0],[1,2])"
  p knight_moves([0,0],[1,2]) # => [[0,0],[1,2]]

  puts "Test 2: knight_moves([0,0],[3,3])"
  p knight_moves([0,0],[3,3]) # => shortest path

  puts "Test 3: knight_moves([3,3],[0,0])"
  p knight_moves([3,3],[0,0]) # => shortest path

  puts "Test 4: knight_moves([0,0],[7,7])"
  p knight_moves([0,0],[7,7]) # => shortest path

  puts "Test 5: knight_moves([3,3],[4,3])"
  p knight_moves([3,3],[4,3]) # => [[3,3],[4,3]]
  
end