class Inventory
  def initialize
    @store = {
      items: [],
      currency: {
        gold: 0,
        silver: 0,
        copper: 0
      }
    }
  end

  def add(item)
    if item.is_a? Item
      add_item(item)
    elsif item.is_a? Currency
      add_currency(item)
    else
      raise "Cannot add an item of class #{item.class}"
    end
  end

  def contains?(item)
    items.include?(item)
  end

  def count
    items.count
  end

  def remove(item)
    remove_item(item)
  end

  def pretty_print
    puts "You are carrying..."
    items.each do |item|
      puts "#{item.name}\n"
    end
  end

  private

  attr_reader :store

  def add_currency(amount)
    puts "add #{amount} to currency"
  end

  def add_item(item)
    return if contains?(item)

    items << item
  end

  def items
    store[:items]
  end

  def remove_item(item)
    return unless contains?(item)

    items.delete(item)
  end
end

