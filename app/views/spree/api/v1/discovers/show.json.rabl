collection @results
attributes :id, :name
node(:img_url){|p| p.master_images.first.attachment.url}
node(:price){|p| p.price}