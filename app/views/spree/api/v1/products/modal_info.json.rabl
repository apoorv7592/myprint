collection @result
attributes :id, :name, :description

node(:master_variant_id){|p| p.master.id}

child :root_comments do 
	attributes :id,:body
	node(:user) do |c|
		u = Spree::User.find(c.user_id)
		u.name
	end
	node(:user_id) do |c|
		c.user_id
	end
end

