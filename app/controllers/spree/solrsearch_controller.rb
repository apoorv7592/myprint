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


		    	facet :designer_id, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :color_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :trim_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
		    	facet :dimension_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact

		    	#with(:color_id).any_of() if params[:color_id].present?
		    	

		    	#dynamic(:color_ids) do
		    	#	facet(:color_names)
		    	#end
		    end
		    @suites = @search.results
		end

	end
end