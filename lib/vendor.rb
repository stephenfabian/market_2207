
class Vendor
  attr_reader :name, :inventory
 
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    inventory[item] += qty
  end

  def potential_revenue
    total_revenue = []
    inventory.each do |item|
      total_revenue << (check_stock(item[0]) * item[0].price)
    end
    total_revenue.sum
  end

end
