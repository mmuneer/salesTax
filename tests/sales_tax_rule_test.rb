require './tests/test_helper'
require './lib/sales_tax_rule'
require './lib/item'
require './lib/constants'

class SalesTaxRuleTest < Test::Unit::TestCase
 context "SalesTaxRule" do
  setup do
      @exempt_item = Item.new("box of imported books","1","24.50")
      @non_exempt_item = Item.new("box of perfume","1","24.50")
      @tax_rate = 0.10
      @sales_tax_rate = Constants::SALES_TAX_RATE
   end
   
   should "not apply this rule if there's a matching exemption" do
     assert_equal(SalesTaxRule.applies_to?(@exempt_item),false)
   end
   
   should "apply this rule if there's no matching exemption" do
     assert(SalesTaxRule.applies_to?(@non_exempt_item))
   end
   
   should "return the correct tax amount for the item" do
     assert_equal(SalesTaxRule.tax_for(@non_exempt_item),2.45)
   end
   
   should "return the correct sales tax rate form constants.rb module" do
     assert_equal(SalesTaxRule.tax_rate(),@sales_tax_rate)
   end
  end
end