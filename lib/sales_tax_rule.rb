require './lib/constants'
#module to determine eligibility and the amount of sales tax 
module SalesTaxRule
    class << self
      def applies_to?(item)
        !item.tax_exempt?
      end

      def tax_for(item)
        item.price * tax_rate     
      end

      def tax_rate
        Constants::SALES_TAX_RATE
      end

    end
  end