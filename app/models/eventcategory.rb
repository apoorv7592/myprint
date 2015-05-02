# == Schema Information
#
# Table name: eventcategories
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  avatar_content_type :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class Eventcategory < ActiveRecord::Base

	has_attached_file :avatar,  styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '350x350>',
    large:  '500x500>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  # Validate the attached image is image/jpg, image/png, etc	

    #has_many :eventsubcat  
end
