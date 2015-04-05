# == Schema Information
#
# Table name: suite_images
#
#  id                  :integer          not null, primary key
#  suite_id            :integer
#  type                :string(255)
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class SuiteImage < ActiveRecord::Base
	belongs_to :suite

	has_attached_file :avatar, styles: {
	    thumb: '100x100>',
	    square: '300x300#',
	    main: '500x500>'
	}

	# Validate the attached image is image/jpg, image/png, etc
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	
end
