class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value)
    new_node = Node.new(value)
    
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end
  
  def prepend(value)
    new_node = Node.new(value)
    
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end
  
  def size
    count = 0
    current = @head
    
    while current
      count += 1
      current = current.next_node
    end
    
    count
  end
  
  def head
    @head
  end
  
  def tail
    @tail
  end
  
  def at(index)
    return nil if index < 0
    
    current = @head
    position = 0
    
    while current && position < index
      current = current.next_node
      position += 1
    end
    
    current
  end
  
  def pop
    return nil if @head.nil?
    
    if @head == @tail
      popped_node = @head
      @head = nil
      @tail = nil
      return popped_node
    end
    
    current = @head
    
    while current.next_node != @tail
      current = current.next_node
    end
    
    popped_node = @tail
    @tail = current
    current.next_node = nil
    
    popped_node
  end
  
  def contains?(value)
    current = @head
    
    while current
      return true if current.value == value
      current = current.next_node
    end
    
    false
  end
  
  def find(value)
    current = @head
    index = 0
    
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    
    nil
  end
  
  def to_s
    result = ""
    current = @head
    
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    
    result + "nil"
  end
end

class Node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :value, :next_node
end