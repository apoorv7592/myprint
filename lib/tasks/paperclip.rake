namespace :paperclip do
  desc "TODO"
  task move_attachements: :environment do
  	Banner.find_each do |post|
      unless post.picture_file_name.blank?
        filename = Rails.root.join('banner', 'pictures', '000','000', post.id.to_s, 'original', post.picture_file_name)

        if File.exists? filename
          puts "Re-saving image attachment #{post.id} - #{filename}"
          image = File.new filename
          post.picture = image
          post.save
          # if there are multiple styles, you want to recreate them :
          post.picture.reprocess! 
          image.close
        end
      end
    end

  end

end
