require_relative 'category'

class BackstagePass < Category
  
  def update_quality
    @sell_in -= 1
    return if quality >= 50
    return @quality = 0 if sell_in < 0
    @quality += 1
    @quality += 1 if sell_in < 10
    @quality += 1 if sell_in < 5
  end

end
