# == Schema Information
#
# Table name: designers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  about               :text
#  active              :boolean
#  city                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer          default(0), not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Designer < ActiveRecord::Base
	has_many :suites
	has_many :entries, dependent: :destroy
	belongs_to :user, class_name: 'Spree::User'

	has_attached_file :avatar,:path => "designers/avatars/000/000/:id/:style/:filename", styles: {
	    thumb: '100x100>',
	    square: '300x300>',
	    medium: '500x500>'
  	}
  	
  	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	scope :active, ->  { where(active: true )}
end
