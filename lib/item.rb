require './lib/constants'
require 'yaml'

class Item

  attr_accessor :quantity, :price, :name, :tax
  def initialize(name,quantity,price)
    @name = name
    @quantity = quantity.to_i
    @price = price.to_f
   end
  
  def imported?
     !!(@name =~ /imported/)
  end
  
  def tax_exempt?
    exemptions.any? { |name| @name =~ /#{name}/ } 
  end
  
  def exemptions
      @exemptions ||= YAML.load File.open(Constants::EXAMPTION_ITEMS)
  end
end