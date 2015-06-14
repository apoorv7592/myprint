Comment.class_eval do 
	belongs_to :user, class_name: 'Spree::User'
	acts_as_taggable
end