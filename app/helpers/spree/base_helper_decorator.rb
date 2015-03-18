Spree::BaseHelper.class_eval do
	
	def display_volume_price(variant, quantity = 1)
		Spree::Money.new(variant.volume_price(quantity), { currency: Spree::Config[:currency] }).to_html
	end
	
	def display_volume_price_earning_percent(variant, quantity = 1)
		variant.volume_price_earning_percent(quantity).round.to_s
	end

	def display_volume_price_earning_amount(variant, quantity = 1)
		Spree::Money.new(variant.volume_price_earning_amount(quantity), { currency: Spree::Config[:currency] }).to_html
	end
	def link_to_add_fields(name, target, options = {})
	  name = '' if options[:no_text]
	  css_classes = options[:class] ? options[:class] + " spree_add_fields" : "spree_add_fields"
	  link_to_with_icon('plus', name, 'javascript:', :data => { :target => target }, :class => css_classes)
	end
	def to_rng(x)
     	case x.count('.')
	         when 2
	             elements = x.split('..')
	             return Range.new(elements[0].to_i, elements[1].to_i)
	         when 3
	             elements = x.split('...')
	             return Range.new(elements[0].to_i, elements[1].to_i-1)
	         else
	             raise ArgumentError.new("Couldn't convert to Range:#{str}")
    	end
 	end
end