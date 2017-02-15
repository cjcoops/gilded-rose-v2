require_relative 'normal'
require_relative 'brie'
require_relative 'category'
require_relative 'backstage_pass'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      index = @items.index(item)
      categorised_item = klass_for(item).new(item.sell_in, item.quality)
      categorised_item.update_quality
      @items[index] = categorised_item
    end
  end

  def klass_for(item)
    case item.name
      when "normal"
        return Normal
      when "Aged Brie"
        return Brie
      when "Sulfuras, Hand of Ragnaros"
        return Category
      when "Backstage passes to a TAFKAL80ETC concert"
        return BackstagePass
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
