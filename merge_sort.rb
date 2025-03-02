def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end 

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1]) # => [0, 1, 1, 2, 3, 5, 8, 13]
p merge_sort([105, 79, 100, 110]) # => [79, 100, 105, 110]