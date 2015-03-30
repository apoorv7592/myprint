module Spree
	class CustsController < Spree::HomeController

		def get_cust
			@s = Suite.where(id: params[:id]).first
			@c = @s.custs.first
			if @c.present?
				@cust = @c
				@leafs = @cust.leafs.present? ? @cust.leafs : @cust.leafs.new

			else
				@cust = @s.custs.new
				@leafs = Leaf.new
			end
		end
		
		def create
			@c = Cust.new(cust_params)
			if @c.save 
				respond_to do |format|
					format.html {redirect_to action: 'show'}
					format.js 
				end
			else
				respond_to do |format|
					format.html {redirect_to :back, error: 'some error occured'}
					format.js {@error= "some error occured"}
				end
			end
		end

		def show
		end

		private 
			def cust_params
				params.require(:cust).permit(:gr_name, :gr_father_name,
					 :gr_mother_name, :gr_address, :br_name, :br_father_name,
					 :br_mother_name, :br_address)
			end
	end
end