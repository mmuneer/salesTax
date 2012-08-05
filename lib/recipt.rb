#class to print the recipt for the cart
class Recipt
  def initialize(cart)
    @cart = cart
  end
  
  def print
     @cart.items.each do |item|
        puts "#{item.quantity()} #{item.name()}: #{(item.price() + item.tax()).round(2)}" 
    end
      puts "Sales Tax: #{@cart.total_tax().round(2)}"
      puts "Total: #{(@cart.total_price() + @cart.total_tax()).round(2)}"
  end
end