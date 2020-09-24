class HeapNode
  attr_reader :key, :value
  def initialize(key, value)
    @key = key
    @value = value
  end
end
class MinHeap
  def initialize
    @store = []
  end
  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    if @store.empty? 
      @store << new_node
      return 
    end 
    @store << new_node
    add_helper(@store.length - 1)
  end
  def add_helper(index) 
    parent_index = heap_up(index)
    if parent_index.nil? || @store[parent_index].key < @store[index].key
      return 
    end 
    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)
    end 
    add_helper(parent_index)
  end 
  # left_child = i * 2 + 1 
  # right_child = i * 2 + 2
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
  end
  # Used for Testing
  def to_s
    return "[]" if @store.empty?
    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end
    output += @store.last.value + "]"
    return output
  end
  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end
  private
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    up_index = (index - 1) / 2
    if up_index < 0 
      return nil
    end 
    return up_index #@store[up_index]
  end
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
  end
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end