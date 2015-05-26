# == Schema Information
#
# Table name: spree_reviews
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  name            :string(255)
#  location        :string(255)
#  rating          :integer
#  title           :text
#  review          :text
#  approved        :boolean          default(FALSE)
#  user_id         :integer
#  ip_address      :string(255)
#  locale          :string(255)
#  show_identifier :boolean          default(TRUE)
#  designer_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class SpreeReviews < ActiveRecord::Base
end
