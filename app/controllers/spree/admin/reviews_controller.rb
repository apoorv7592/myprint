class Spree::Admin::ReviewsController < Spree::Admin::ResourceController
	helper Spree::ReviewsHelper
	
	def index
		#@reviews = Spree::Review.all
		@reviews = collection
	end
	
	def approve
		review = Spree::Review.find(params[:id])
		if review.update_attribute(:approved, true)
			flash[:notice] = Spree.t(:info_approve_review)
		else
			flash[:error] = Spree.t(:error_approve_review)
		end
		redirect_to admin_reviews_path
	end

	def edit
		return if @review.suite
			flash[:error] = Spree.t(:error_no_product)
			redirect_to admin_reviews_path
		end
	
	private
		def collection
			params[:q] ||= {}
			@search = Spree::Review.ransack(params[:q])
			@collection = @search.result.includes([:suite, :user, :feedback_reviews])
		end
end