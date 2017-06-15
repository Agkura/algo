require_relative 'p04_linked_list'
require_relative 'p06_hash_map'

def reverse(linked)
  linked.each do | node |
    p node.to_s
    next_node = node.next
    prev_node = node.prev
    node.next = prev_node
    node.prev = next_node
  end
  linked.head.next.prev = linked.last
  linked.tail.prev.next = linked.first
  front = linked.head.next
  linked.head.next = linked.tail.prev
  linked.tail.prev = front
end

-----

write an explanation of an lru cache

=begin
  a. LRU cache will mantain a limited list of our most recently accessed items.
  b. The most recent will move to the top of our list while the least used will be pushed to
    the back.
  c. at a certain point, the max limit of our LRU cache, we'll begin unloading the older
    values if new ones need to be added.
  d.  This ensures that the lru cache will remain at the most the max limit or less.

  1. We'll implement a doubly-linked list and a hashmap to create the core
    of our lru cache
  2. let's assume we're caching the values of perfect squares.
  3. our hashmap keys will be the base of the perfect square.
    (2,3,4 etc with perfect squares being 4,9,16)
  4. the values will be pointers to node in our linked list.
  5. the nodes in the linked list will have the same keys as the hashmap
  6. but the values of the nodes will be the perfect square.
  7. the lru cache will store a proc which will be the proc to find the
    perfect square value
  8. if the hashmap has the key then access the point and access the linked list.
  9. if the hashmap does not have the key, check the hashmap size, act accordingly
    and create a new value in the hashmap pointing at a new value appended to the
    linkedlist which the key and value is the set for a perfect square
  10. if retrieving a value that exists, make sure to move that value to the end of the list
  11. if deleting, make sure to remove the head of the list as well as the value
    in the hashmap
=end
class LRUCache
  def initialize(max = 5, prc)
    @hash = HashMap.new
    @store = LinkedList.new
    @prc = prc
    @count = 0
  end

  def get(key)

  end

  private
  attr_reader :prc
  attr_accessor :hash, :store, :count

  def update!
    
  end

  def eject!
  end

  def new_cache!
  end

end
