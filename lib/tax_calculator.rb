require './lib/constants'
#class for calculating the tax for the shopping cart
class TaxCalculator
  class << self
      def applicable_taxes_for(product)
         applicable_rules ||= []
          TaxRule.rules.each do |r|
            applicable_rules << r if r.applies_to? product
        end
         applicable_rules
      end


      def tax_for(product)
        taxes = applicable_taxes_for(product). map { |s| s.tax_for product } 
        result = taxes.inject(0) { |result, element| result + element }
        result
       end
      
      def base_tax(product)
       (product.quantity() * tax_for(product))
      end

     def tax(product)
      rounding_coefficient = 1 / rounding_to_nearest_factor
      (rounding_coefficient * base_tax(product)).ceil / rounding_coefficient
    end
    
      def calculate_price(product)
       product.quantity() * product.price()
      end

     def calculate_taxes(product)
       tax(product)
     end

     def rounding_to_nearest_factor
      Constants::ROUNDING_TO_THE_NEAREST_FACTOR
     end
    end
end