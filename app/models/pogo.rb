# == Schema Information
#
# Table name: pogos
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  position            :integer
#  category            :string(255)
#

class Pogo < ActiveRecord::Base
    has_attached_file :avatar, styles: {
        small: '250x200',
        main: '1000x650>',
        first: '1000x311>',
        second: '492x311>',
        third: '238x268',
        fifth: '746x593>',
        sixth: '365x311',
        seventh: '238x238',
        eigth: '238x137'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
