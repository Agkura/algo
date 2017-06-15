require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node_val = @map.get(key)
    if node_val
      update_node!(key)
      return node_val
    else
      eject! if count == @max
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    @map.set(key, @store.append(key, val))
    val
  end

  def update_node!(key)
    fresh_node = @store.remove(key)
    @store.append(fresh_node.key, fresh_node.val)
  end

  def eject!
    removal = @store.first.key
    @map.delete(removal)
    @store.remove(removal)
  end
end
