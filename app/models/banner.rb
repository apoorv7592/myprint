# == Schema Information
#
# Table name: banners
#
#  id                   :integer          not null, primary key
#  category             :string(255)
#  position             :integer
#  enabled              :boolean          default(FALSE)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Banner < ActiveRecord::Base

  # This method associates the attribute ":attachment" with a file attachment
  has_attached_file :picture, :path => "banners/pictures/:id/:style/:filename", styles: {
    small: '250x200',
    main: '1000x593>',
    first: '1000x311>',
    second: '492x311>',
    third: '238x268',
    fifth: '746x593>',
    sixth: '365x311',
    seventh: '238x238',
    eigth: '238x137'
  }

  # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
