collection @result
attributes :id, :name, :price

node(:description){|p| simple_format(p.description)}

node(:master_variant_id){|p| p.master.id}


child :master_images do 
	node(:url){|d| d.attachment.url}
end

child :designer do 
	attributes :name
	node(:img){|d| d.avatar.url}
end


node(:overview_text) do |p|
	ov = p.overview
	if ov.present?
		res = ""
		ovs = ov.split('.')
		ovs.each do |o|
			res = res +"<li>" + o + "</li>"
		end
		res = simple_format(res)
	end
end

child :root_comments do 
	attributes :id,:body
	node(:user) do |c|
		u = Spree::User.find(c.user_id)
		u.full_name
	end
	node(:user_id) do |c|
		c.user_id
	end
end

node(:prod_url) do |p|
	"/products/"+p.slug
end