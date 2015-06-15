Spree::User.class_eval do
	devise :confirmable
	has_one :designer
	has_many :entries
	has_many :custs
	has_many :comments
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :phone, presence: true
	validates :gender, presence: true

	has_many :likes, dependent: :destroy

	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy


    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    has_many :discoverfollows, class_name: "Discoverfollow", dependent: :destroy
    has_many :discover_following, through: :discoverfollows, source: :discover

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

  	def follow_discover(discover)
  		discoverfollows.create(discover_id: discover.id)
  	end

  	def unfollow_discover(discover)
		discoverfollows.find_by(discover_id: discover.id).destroy
	end

	def following_discover?(discover)
		discover_following.include?(discover)	
	end
  	
  	def is_designer?
  		self.is_designer
  	end

  	def full_name
		if self.first_name.present? && self.last_name.present?
  			self.first_name+' '+ self.last_name 
  		else
  			''
  		end
  	end

	#has_many :discoverfollows
	#has_many :discovers, :through => :discoverfollows

	#has_many :pinned, through: :discoverfollows, source: :discover
    #has_many :pins, through: :discoverfollows, source: :user

    #pins a discover
	#def pin(discover)
	#  discoverfollows.create(discover_id: discover.id)
	#end
	# Unpins a discover.
	#def unpin(discover)
	#	discoverfollows.find_by(discover_id: discover.id).destroy
	#end
	# Returns true if the current user is following the discover.
	#def pinned?(discover)
    #	pinned.include?(discover)
  	#end

end