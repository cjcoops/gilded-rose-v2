require_relative 'normal'
require_relative 'brie'
require_relative 'sulfuras'
require_relative 'backstage_pass'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      index = @items.index(item)
      @items[index] = item_handler(item)
    end
  end

  def item_handler(item)
    case item.name
      when "normal"
        item = Normal.new(item.sell_in, item.quality)
        item.update_quality
        item
      when "Aged Brie"
        item = Brie.new(item.sell_in, item.quality)
        item.update_quality
        item
      when "Sulfuras, Hand of Ragnaros"
        item = Sulfuras.new(item.sell_in, item.quality)
        item.update_quality
        item
      when "Backstage passes to a TAFKAL80ETC concert"
        item = BackstagePass.new(item.sell_in, item.quality)
        item.update_quality
        item
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
