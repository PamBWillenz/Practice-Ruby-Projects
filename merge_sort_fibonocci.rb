def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end 

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1]) # => [0, 1, 1, 2, 3, 5, 8, 13]
p merge_sort([105, 79, 100, 110]) # => [79, 100, 105, 110]

def fibs_recursive(n, fibs = [0, 1])
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  return fibs if n == fibs.size

  fibs_recursive(n, fibs << fibs[-1] + fibs[-2])
end

fibs(8) # => [0, 1, 1, 2, 3, 5, 8, 13]
fibs_recursive(8) # => [0, 1, 1, 2, 3, 5, 8, 13]