class DesignerreviewsController < Spree::StoreController
  helper Spree::BaseHelper
  before_action :load_designer, only: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @approved_reviews = Designerreview.approved.where(designer: @designer)
  end

  def new
    @review = Designerreview.new(designer: @designer)
    authorize! :create, @review
  end

  # save if all ok
  def create
    params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?

    @review = Designerreview.new(review_params)
    @review.designer = @designer
    @review.user = spree_current_user if spree_user_signed_in?
    @review.ip_address = request.remote_ip
    @review.locale = I18n.locale.to_s if Designerreviews::Config[:track_locale]

    authorize! :create, @review
    if @review.save
      flash[:notice] = Spree.t(:review_successfully_submitted)
      redirect_to designer_path(@designer)
    else
      render :new
    end
  end

  private

  def load_designer
    @designer = Designer.friendly.find(params[:designer_id])
  end

  def permitted_review_attributes
    [:rating, :title, :review, :name, :show_identifier]
  end

  def review_params
    params.require(:review).permit(permitted_review_attributes)
  end
end