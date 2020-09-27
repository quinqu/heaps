class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end


class MinHeap
  def initialize(store = [])
    @store = store
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log(n)) using heap up method
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
  # Time Complexity: O(log(n)) - using heap down method
  # Space Complexity: O(1)
  def remove
    if @store.empty?
      return nil
    end
    removed = @store[0]
    swap(0, @store.length - 1)
    @store = @store[0...-1]

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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log(n))
  # Space complexity: O(1)

  def heap_up(index)
    up_index = (index - 1) / 2
    parent_index = up_index

    if parent_index < 0 || @store[parent_index].key < @store[index].key
      return 
    end 

    swap(parent_index, index)
    heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's bigger
  #  than it's parent node.
  def heap_down(index)
    left = index * 2 + 1
    right = index * 2 + 2
    min = left

    if left >= @store.length    
      return
    end
    
    if right < @store.length && @store[left].key > @store[right].key
      min = right
    end

    if @store[index].key < @store[min].key
      return 
    end 

    swap(index, min)
    heap_down(min)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end