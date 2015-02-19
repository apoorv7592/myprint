Spree::User.class_eval do
	devise :confirmable
	has_one :designer
	has_many :entries
	has_many :likes, dependent: :destroy

	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy


    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    # Follows a user.
	def follow(other_user)
	  active_relationships.create(followed_id: other_user.id)
	end
	# Unfollows a user.
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end
	# Returns true if the current user is following the other user.
	def following?(other_user)
    	following.include?(other_user)
  	end

  	def is_designer?
  		self.is_designer
  	end
end