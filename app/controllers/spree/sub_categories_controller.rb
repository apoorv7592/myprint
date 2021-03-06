module Spree
	class SubCategoriesController < Spree::HomeController
		def show
			@subcat = SubCategory.find(params[:id])
			@suitexx = @subcat.suites
			@search = Sunspot.search(Suite) do 
		    	fulltext params[:search]
		    	with(:available_on).less_than(Time.zone.now)
		    	with(:sub_category_id, params[:id])
		    	designer_filter = with(:designer_id, params[:designer]) if params[:designer].present?
		    	color_filter = with(:color_ids, params[:color_id]) if params[:color_id].present?
				trim_filter = with(:trim_ids, params[:trim_id]) if params[:trim_id].present?		    	
				dimension_filter = with(:dimension_ids, params[:dimension_id]) if params[:dimension_id].present?		    	
				
				order_by(:position, :desc)
				order_by(:created_at, :desc) if params[:created_at]
				order_by(:like_no, :desc) if params[:like_no]
				order_by(:avg_rating, :desc) if params[:avg_rating]
				order_by(:price, :desc) if params[:price]
				
		    	facet :designer_id, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :color_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :trim_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :dimension_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	
		    end
		    @scsuite = @search.results
		    
		end
	end
end