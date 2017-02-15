require_relative 'normal'
require_relative 'brie'
require_relative 'category'
require_relative 'backstage_pass'

class GildedRose

  DEFAULT_CLASS = Category
  SPECIALIZED_CLASSES = {
    'normal' => Normal,
    'Aged Brie' => Brie,
    'Backstage passes to a TAFKAL80ETC concert' => BackstagePass
  }

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      index = @items.index(item)
      categorised_item =
        (SPECIALIZED_CLASSES[item.name] || DEFAULT_CLASS)
          .new(item.sell_in, item.quality)
      categorised_item.update_quality
      @items[index] = categorised_item
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
