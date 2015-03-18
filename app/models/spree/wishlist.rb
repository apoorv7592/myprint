# == Schema Information
#
# Table name: spree_wishlists
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  access_hash :string(255)
#  is_private  :boolean          default(TRUE), not null
#  is_default  :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Spree::Wishlist < ActiveRecord::Base
	belongs_to :user, class_name: Spree.user_class
	has_many :wished_products, dependent: :destroy
	before_create :set_access_hash
	validates :name, presence: true

	def include?(suite_id)
		wished_products.map(&:suite_id).include? suite_id.to_i
	end
	
	def to_param
		access_hash
	end
	
	def self.get_by_param(param)
		Spree::Wishlist.find_by_access_hash(param)
	end
	
	def can_be_read_by?(user)
		!self.is_private? || user == self.user
	end
	
	def is_default=(value)
		self[:is_default] = value
		return unless is_default?
		Spree::Wishlist.where(is_default: true, user_id: user_id).where.not(id: id).update_all(is_default: false)
	end

	def is_public?
		!self.is_private?
	end
	
	private
		def set_access_hash
			random_string = SecureRandom.hex(16)
			self.access_hash = Digest::SHA1.hexdigest("--#{user_id}--#{random_string}--#{Time.now}--")
		end
end
