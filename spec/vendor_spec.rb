require './lib/item'
require './lib/vendor'

describe Vendor do

  it 'test' do
  
    vendor = Vendor.new("Rocky Mountain Fresh")
  
    expect(vendor).to be_an_instance_of(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
    
  end
end