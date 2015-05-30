# == Schema Information
#
# Table name: spree_feedback_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  review_id  :integer          not null
#  rating     :integer          default(0)
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#  locale     :string(255)      default("en")
#

class Spree::FeedbackReview < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s
  belongs_to :review, dependent: :destroy

  validates :review, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: Spree.t(:you_must_enter_value_for_rating)
  }

  default_scope { most_recent_first }
  scope :most_recent_first, -> { order('spree_feedback_reviews.created_at DESC') }
  scope :localized, ->(lc) { where('spree_feedback_reviews.locale = ?', lc) }
end
