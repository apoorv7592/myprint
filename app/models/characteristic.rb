class Characteristic < ActiveRecord::Base
	belongs_to :suite
	belongs_to :variant 
	
	has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large:  '500x500>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  # Validate the attached image is image/jpg, image/png, etc
end
