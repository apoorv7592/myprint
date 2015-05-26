class Designerratings < ActiveRecord::Base
  belongs_to :designer
  belongs_to :spree_users, :class_name => 'Spree::User'
end
