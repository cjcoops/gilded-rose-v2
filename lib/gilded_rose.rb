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
        return normal_update_quality(item)
      when "Aged Brie"
        return aged_brie_update_quality(item)
      when "Sulfuras, Hand of Ragnaros"
        return sulfuras_update_quality(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        return backstage_passes_update_quality(item)
    end
  end

  def normal_update_quality(item)
    new_item = Normal.new(item.sell_in, item.quality)
    new_item.update_quality
    new_item
  end

  def aged_brie_update_quality(item)
    new_item = Brie.new(item.sell_in, item.quality)
    new_item.update_quality
    new_item
  end

  def sulfuras_update_quality(item)
    new_item = Sulfuras.new(item.sell_in, item.quality)
    new_item.update_quality
    new_item
  end

  def backstage_passes_update_quality(item)
    new_item = BackstagePass.new(item.sell_in, item.quality)
    new_item.update_quality
    new_item
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
