require_relative 'category'

class Brie < Category

  def update_quality
    @sell_in -= 1
    return if quality >= 50
    @quality += 1
    @quality += 1 if sell_in <= 0
  end

end
