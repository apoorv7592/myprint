Spree::OrdersController.class_eval do
	def populate
      populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
      
      vars = params[:variant_id]

      success = true
      vars.each do |v|
	      if populator.populate(v, params[:quantity], params[:options])
	        
	        
	      else
	        success = false
	        break
	      end
	  end

	    if success
		  	respond_with(@order) do |format|
		         format.html { redirect_to cart_path }
	   		end
	   	else
	   		flash[:error] = populator.errors.full_messages.join(" ")
	        redirect_back_or_default(spree.root_path)
		end
    end
end