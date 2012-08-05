require './lib/item'
require './lib/constants'
require './tests/test_helper'
class ItemTest < Test::Unit::TestCase
  context "Item" do
    setup do
        @item = Item.new("box of books","1","24.50")
         @name = "box of imported books"
         @qunatity = 2
         @price = 20.50
         @tax = 2.45
         @item.stubs(:exemptions).returns(['choclate', 'book','pill'])
    end
    context "attr_accessor :name" do
      should "set the name" do
         assert_equal(@item.name=(@name),@name)
      end
    
      should "get the name" do
         @item.name=(@name)
         assert_equal(@item.name(),@name)
      end
    end
    
    context "attr_accessor :price" do
      should "set the price" do
         assert_equal(@item.price=(@price),@price)
      end
      should "get the price" do
         assert_equal(@item.price(),24.50)
      end
    end
   
   context "attr_accessor :quantity" do
     should "set the quantity" do
         assert_equal(@item.quantity=(@quantity),@quantity)
      end
      should "get the quantity" do
         assert_equal(@item.quantity(),1)
     end
    end 
    
   context "attr_accesssor :tax_amount" do
     should "set the tax amount" do
         assert_equal(@item.tax=(@tax),@tax)
      end
      should "get the tax amount" do
         @item.tax=(@tax)
         assert_equal(@item.tax(),@tax)
     end
   end
   
    context "imported?" do
      should "return false if item is not imported" do
        @item.name=("box of books")
       assert_equal(@item.imported?,false)
     end
     
     should "return true if item is imported" do
        @item.name=("box of imported books")
       assert(@item.imported?)
     end
   end
   
    context "tax_exempt?" do
      should "return false if item is not exempt" do
        @item.name=("box of perfume")
       assert_equal(@item.tax_exempt?,false)
     end
     
     should "return true if item is exempt" do
        @item.name=("box of imported books")
       assert(@item.tax_exempt?)
     end
   end
   
   context "exemptions" do
     should "load yml for the source" do
        assert_equal(@item.exemptions,['choclate', 'book','pill']) 
     end
   end
   
  end
end