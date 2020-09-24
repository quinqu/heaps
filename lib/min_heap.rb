class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

 # left_child = i * 2 + 1 
 # right_child = i * 2 + 2

class MinHeap
  def initialize
    @store = []
  end
  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)

    if @store.empty? 
      @store << new_node
      return 
    end 

    @store << new_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def remove()
    if @store.empty?
      return nil
    end
    removed = @store[0]
    swap(0, @store.length - 1)
    @store = @store[1..-1]

    heap_down(0)
    return removed.value
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
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?

  def heap_up(index)
    up_index = (index - 1) / 2
    parent_index = up_index

    if parent_index < 0 || @store[parent_index].key < @store[index].key
      return 
    end 

    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)
    end 

    heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    down_index = (index + 1) * 2
    
    if down_index > @store.length || @store[down_index].key > @store[index].key
      return 
    end 

    if @store[down_index].key < @store[index].key
      swap(down_index, index)
    end 

    heap_down(down_index)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end