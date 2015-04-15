module Spree
	class SolrsearchController < Spree::HomeController

		def index
			@search = Sunspot.search(Suite) do 
		    	fulltext params[:search]
		    	with(:available_on).less_than(Time.zone.now)
		    	designer_filter = with(:designer_id, params[:designer]) if params[:designer].present?
		    	color_filter = with(:color_ids, params[:color_id]) if params[:color_id].present?
				trim_filter = with(:trim_ids, params[:trim_id]) if params[:trim_id].present?		    	
				dimension_filter = with(:dimension_ids, params[:dimension_id]) if params[:dimension_id].present?		    	
				sub_category_filter = with(:sub_category_ids, params[:sub_category_id]) if params[:sub_category_id].present?		    	
				
				order_by(:created_at, :desc) if params[:created_at]
				order_by(:like_no, :desc) if params[:like_no]
				order_by(:avg_rating, :desc) if params[:avg_rating]
				order_by(:price, :asc) if params[:price]
				order_by(:position, :desc)

		    	facet :designer_id, exclude: [designer_filter, color_filter, trim_filter, dimension_filter, sub_category_filter].compact
		    	facet :color_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter, sub_category_filter].compact
		    	facet :trim_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter, sub_category_filter].compact
		    	facet :dimension_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter, sub_category_filter].compact
		    	facet :sub_category_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter, sub_category_filter].compact
		    	#with(:color_id).any_of() if params[:color_id].present?
		    	
               paginate :page => params[:page], :per_page => 12

		    	#dynamic(:color_ids) do
		    	#	facet(:color_names)
		    	#end
		    end
		    @suites = @search.results
		end

		
	end
end