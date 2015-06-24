collection @result
attributes :id, :name, :description

node(:description){|p| simple_format(p.description)}

node(:master_variant_id){|p| p.master.id}

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

