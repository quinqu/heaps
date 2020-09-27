require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: 0(n)

def heapsort(list)
  list_heap = MinHeap.new()

  list.each do |i|
    list_heap.add(i)
  end 

  i = 0

  while i < list.length
    list[i] = list_heap.remove
    i += 1
  end 
  return list
end
