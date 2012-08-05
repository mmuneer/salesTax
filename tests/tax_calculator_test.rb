require './tests/test_helper'
require './lib/tax_rule'
require './lib/import_tax_rule'
require './lib/sales_tax_rule'
require './lib/item'
require './lib/tax_calculator'
require './lib/constants'

class TaxCalculatorTest < Test::Unit::TestCase
  context "TaxCalculator" do
    setup do
      @import_item = Item.new("box of imported books","1","24.50")
      @non_import_item = Item.new("box of perfume","2","24.50")
      @nearest_cofactor = Constants::ROUNDING_TO_THE_NEAREST_FACTOR
    end
    
    context "applicable_taxes_for" do
      should "return the applicable tax names for the product" do
         TaxRule.rules().clear()
         TaxRule.add_rule(Object.const_get("ImportTaxRule"))
         TaxRule.add_rule(Object.const_get("SalesTaxRule"))
         assert_equal(TaxCalculator.applicable_taxes_for(@non_import_item),[SalesTaxRule])
         assert_equal(TaxCalculator.applicable_taxes_for(@import_item),[ImportTaxRule])
      end     
    end
    
    context "tax_for" do
      should "return the tax amount for a single product" do
        TaxRule.rules().clear()
        TaxRule.add_rule(Object.const_get("ImportTaxRule"))
        TaxRule.add_rule(Object.const_get("SalesTaxRule"))
        assert_equal(TaxCalculator.tax_for(@import_item).round(2),1.23)
        assert_equal(TaxCalculator.tax_for(@non_import_item).round(2),2.45)      
      end
    end
    
    context "base_tax" do
      should "return the base tax for the product(s) in the cart" do
        TaxRule.rules().clear()
        TaxRule.add_rule(Object.const_get("ImportTaxRule"))
        TaxRule.add_rule(Object.const_get("SalesTaxRule"))
       assert_equal(TaxCalculator.base_tax(@import_item).round(2),1.23)
       assert_equal(TaxCalculator.base_tax(@non_import_item).round(2),4.9)  
      end
    end
    
    context "calculate_price" do
      should "calculate total price for the product(s)" do
       assert_equal(TaxCalculator.calculate_price(@import_item).round(2),24.50)
       assert_equal(TaxCalculator.calculate_price(@non_import_item).round(2),49)
      end
    end
    
    context "calculate_taxes" do
      should "calculate total tax for the product(s)" do
       TaxRule.rules().clear()
       TaxRule.add_rule(Object.const_get("ImportTaxRule"))
       TaxRule.add_rule(Object.const_get("SalesTaxRule")) 
       assert_equal(TaxCalculator.calculate_taxes(@import_item).round(2),1.25)
       assert_equal(TaxCalculator.calculate_taxes(@non_import_item).round(2),4.9)  
      end
    end
    
    context "rounding_to_the_nearest_cofactor" do
      should "round to the specified cofactor" do
        assert_equal(TaxCalculator.rounding_to_nearest_factor,@nearest_cofactor)
      end
    end
  end
end