class Market
  attr_reader :name, :vendors
 
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor 
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) > 0 
    end
  end

  #helper 

  def total_quantity_item(item)
    total_quantity = []
    @vendors.each do |vendor|
      total_quantity << vendor.check_stock(item)
    end
    total_quantity.sum
  end

  def total_inventory
    total_invt_hash = Hash.new(0)

    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total_invt_hash[item[0]] = {:quantity => total_quantity_item(item[0]), :vendors => vendors_that_sell(item[0])}
      end
    end
    total_invt_hash
  end

  def overstocked_items
    overstocked_array = []
    total_inventory.each do |item|
      overstocked_array << item[0] if vendors_that_sell(item[0]).count >= 2 && total_inventory[item[0]][:quantity] > 50
    end
    overstocked_array
  end

end
