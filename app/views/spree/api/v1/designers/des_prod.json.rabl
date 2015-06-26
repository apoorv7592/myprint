collection @results
attributes :id, :name, :description
node(:price){|p| p.price}
node(:short_descrip){|d| truncate(d.description, length:140)}
node(:description){|d| simple_format(d.description)}
child :designer do 
	attributes :id,:name, :slug
	node(:img){|d| d.avatar.url}
end

child :master_images do 
	node(:url){|d| d.attachment.url(:large)}
end
