class Rating < ActiveRecord::Base
  belongs_to :suite
  belongs_to :spree_users, :class_name => 'Spree::User'
  
end