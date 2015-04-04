module Spree
	class ShopController < Spree::HomeController
		
		def wedding
			@subcat = SubCategory.friendly.find(params[:id])
			sub_cat_id = @subcat.id
			#search(q,sub_cat_id,designer, color_id, trim_id,dimension_id, created_at,like_no,avg_rating,price )
			@search = Suite.search(params[:search], sub_cat_id, params[:designer],
				params[:color_id], params[:trim_id], params[:dimension_id],
				params[:created_at], params[:like_no], params[:avg_rating], params[:price])
		    
		    @scsuite = @search.results
		end
		def greeting
			@subcat = SubCategory.friendly.find(params[:id])
			sub_cat_id = @subcat.id
			@search = Suite.search(params[:search], sub_cat_id, params[:designer],
				params[:color_id], params[:trim_id], params[:dimension_id],
				params[:created_at], params[:like_no], params[:avg_rating], params[:price])

		    @scsuite = @search.results
		end
		def partyinvites
			@subcat = SubCategory.friendly.find(params[:id])
			sub_cat_id = @subcat.id
			@search = Suite.search(params[:search], sub_cat_id, params[:designer],
				params[:color_id], params[:trim_id], params[:dimension_id],
				params[:created_at], params[:like_no], params[:avg_rating], params[:price])			
		    @scsuite = @search.results
		end

	end
end