class Spree::ReviewsController < Spree::StoreController

	helper Spree::BaseHelper
	before_action :load_product, only: [:index, :new, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :render_404

	def index
		@approved_reviews = Spree::Review.approved.where(product: @suite)
	end

	def new
		@review = Spree::Review.new(suite: @suite)
		authorize! :create, @review	
	end

	# save if all ok
	def create
		params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?
		@review = Spree::Review.new(review_params)
		@review.suite_id = @suite.id
		@review.name = spree_current_user.name if spree_user_signed_in?
		@review.user = spree_current_user if spree_user_signed_in?
		@review.ip_address = request.remote_ip
		@review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
		authorize! :create, @review
		
		if @review.save
			flash[:notice] = Spree.t(:review_successfully_submitted)
			#redirect_to spree.suite_path(@suite)
			respond_to do |format|
				format.html {redirect_to spree.suite_path(@suite)}
				format.js 
			end
		else
			redirect_to :back, notice: @review.errors.full_messages.to_sentence
		end
	end

	private
		def load_product
			@suite = Suite.where(id: params[:review]['suite_id']).first
		end
		
		def permitted_review_attributes
			[:rating, :title, :review, :name, :show_identifier, :suite_id]
		end
		def review_params
			params.require(:review).permit(permitted_review_attributes)
		end
end