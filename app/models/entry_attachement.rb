# == Schema Information
#
# Table name: entry_attachements
#
#  id                 :integer          not null, primary key
#  entry_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class EntryAttachement < ActiveRecord::Base
	belongs_to :entry

	has_attached_file :image, path: "entry_attachements/pictures/000/000/:id/:style/:filename", styles: {
    	thumb: '100x100>',
    	medium: '300x300>',
    	display: '550x550>',
  	}
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :image
	
  	do_not_validate_attachment_file_type :image

	#validates_attachment_size :image, :less_than => 1.megabytes, message: 'File is too big, 
	#make sure it is less than 1 mb'

end
