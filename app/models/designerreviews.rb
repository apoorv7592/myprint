# == Schema Information
#
# Table name: designerreviews
#
#  id              :integer          not null, primary key
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

class Designerreviews < ActiveRecord::Base
end
