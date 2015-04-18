# == Schema Information
#
# Table name: characteristics
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  suite_id            :integer
#  variant_id          :integer
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  color               :string(255)
#

class Characteristic < ActiveRecord::Base
	belongs_to :suite
	#belongs_to :variant 
	
	has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large:  '500x500>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  # Validate the attached image is image/jpg, image/png, etc
end
