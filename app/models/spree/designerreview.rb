class Designerreviews < ActiveRecord::Base

  belongs_to :designer, touch: true
  belongs_to :user, class_name: Spree.user_class.to_s
  has_many   :feedback_reviews

  after_save :recalculate_designer_rating, if: :approved?
  after_destroy :recalculate_designer_rating

  validates :name, :review, presence: true
  validates :rating, numericality: {
    only_integer: true
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: Spree.t(:you_must_enter_value_for_rating)
  }

  default_scope { order('designerreviews.created_at DESC') }

  scope :localized, ->(lc) { where('sreviews.locale = ?', lc) }
  scope :most_recent_first, -> { order('designerreviews.created_at DESC') }
  scope :oldest_first, -> { reorder('designerreviews.created_at ASC') }
  scope :preview, -> { limit(Designerreviews::Config[:preview_size]).oldest_first }
  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :default_approval_filter, -> { Designerreviews::Config[:include_unapproved_reviews] ? all : approved }

  def feedback_stars
    return 0 if feedback_reviews.size <= 0
    ((feedback_reviews.sum(:rating) / feedback_reviews.size) + 0.5).floor
  end

  def recalculate_designer_rating
    designer.recalculate_rating if designer.present?
  end
end