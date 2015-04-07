class Picture < ActiveRecord::Base

  # This method associates the attribute ":attachment" with a file attachment
  has_attached_file :avatar,:path => "pictures/avatars/:id/:style/:filename", styles: {
      small: '100x100>',
      square: '250x250>',
      rectangle: '1000x500>'
    }


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
