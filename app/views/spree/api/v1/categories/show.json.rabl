collection @results
attributes :id, :name, :description
node(:img_url){|p| p.master_images.first.attachment.url}
node(:price){|p| p.price}
node(:short_descrip){|d| truncate(d.description, length:140)}

child :designer do 
	attributes :name
	node(:img){|d| d.avatar.url}
end
