# == Schema Information
#
# Table name: ratings
#
#  id       :integer          not null, primary key
#  stars    :integer          default(0)
#  suite_id :integer
#  user_id  :integer
#

class Rating < ActiveRecord::Base
  belongs_to :suite
  belongs_to :spree_users, :class_name => 'Spree::User'
  
end
