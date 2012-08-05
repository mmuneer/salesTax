require './tests/test_helper'
require './lib/tax_rule'
require './lib/import_tax_rule'
require './lib/sales_tax_rule'
class TaxRuleTest < Test::Unit::TestCase
  context "TaxRule" do
    setup do 
      TaxRule.rules().clear()
    end
    
    context "add_rule" do
      should "add the rule to @@rules" do
       TaxRule.add_rule(Object.const_get("ImportTaxRule"))
       TaxRule.add_rule(Object.const_get("SalesTaxRule"))
       assert_equal(TaxRule.rules().size(),2)
       assert_equal(TaxRule.rules(),[ImportTaxRule,SalesTaxRule])
      end
    end
  end
  
end