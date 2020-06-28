class MaxPriorityQueue
  def initialize
    @heap = [[nil]]
  end

  def insert(item)
    @heap << item
    bubble_up(last_index)
    self
  end

  def next
    maximum = @heap[1]
    swap(1, last_index)
    @heap.pop
    bubble_down(1)
    maximum
  end

  private

  def bubble_up(index)
    parent_index = index / 2

    return if parent_index.zero?

    child = @heap[index][0]
    parent = @heap[parent_index][0]

    if parent < child
      swap(index, parent_index)
      bubble_up(parent_index)
    end
  end

  def last_index
    @heap.length - 1
  end

  def swap(index_a, index_b)
    @heap[index_a], @heap[index_b] = @heap[index_b], @heap[index_a]
  end

  def bubble_down(index)
    left_child_index = index * 2
    right_child_index = index * 2 + 1

    return if left_child_index > last_index

    lesser_child_index = determine_lesser_child(left_child_index, right_child_index)

    if @heap[index][0] < @heap[lesser_child_index][0]
      swap(index, lesser_child_index)
      bubble_down(lesser_child_index)
    end
  end

  def determine_lesser_child(left_child_index, right_child_index)
    return left_child_index if right_child_index > last_index

    if @heap[left_child_index][0] > @heap[right_child_index][0]
      left_child_index
    else
      right_child_index
    end
  end
end