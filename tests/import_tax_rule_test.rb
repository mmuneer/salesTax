require './tests/test_helper'
require './lib/import_tax_rule'
require './lib/item'
require './lib/constants'

class ImportTaxRuleTest < Test::Unit::TestCase
  context "ImportTaxRule" do
    setup do
        @import_item = Item.new("box of imported books","1","24.50")
        @non_import_item = Item.new("box of perfume","1","24.50")
        @tax_rate = 0.05
        @import_tax_rate = Constants::IMPORT_TAX_RATE
    end
    
    should "not apply this rule if item is not imported" do
     assert_equal(ImportTaxRule.applies_to?(@non_import_item),false)
    end
    
    should "apply this rule if item is imported" do
     assert(ImportTaxRule.applies_to?(@import_item))
    end
    
    should "return the correct tax amount for the item" do
     assert_equal(ImportTaxRule.tax_for(@import_item),1.225)
   end
   
   should "return the correct sales tax rate form constants.rb module" do
     assert_equal(ImportTaxRule.tax_rate(),@import_tax_rate)
   end 
  end
end