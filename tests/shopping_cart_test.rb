require './tests/test_helper'
require './lib/shopping_cart'
require './lib/item'
class ShoppingCartTest < Test::Unit::TestCase
  context "Shopping Cart" do
    setup do
      @item1 = Item.new("book",1,12.03)
      @item2 = Item.new("perfume",2,10.39)
      @total_price = 20.05
      @total_tax = 4.08
      @cart = ShoppingCart.new()
    end
    context "attr_accessor :items" do
      should "set the items" do
         assert_equal(@cart.items=([@item1,@item2]),[@item1,@item2])
      end
      should "get the items" do
         @cart.items=([@item1,@item2])
         assert_equal(@cart.items(),[@item1,@item2])
      end   
    end
    
    context "attr_accessor :total_price" do
      should "set the total price for the cart" do
         assert_equal(@cart.total_price=(@total_price),@total_price)
      end
      should "get the total price for the cart" do
         @cart.total_price=(@total_price)
         assert_equal(@cart.total_price(),@total_price)
      end
    end
    
    context "attr_accessor :total_tax" do
      should "set the total tax for the cart" do
         assert_equal(@cart.total_tax=(@total_tax),@total_tax)
      end
      should "get the total tax for the cart" do
         @cart.total_tax=(@total_tax)
         assert_equal(@cart.total_tax(),@total_tax)
      end
    end
    
    context "add" do
      should "add new item to the cart" do
        @cart.add(@item1)
        @cart.add(@item2)
        assert_equal(@cart.items(),[@item1,@item2])
      end
    end
    
  end
end