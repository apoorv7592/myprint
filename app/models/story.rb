# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  actor_id    :integer
#  actor_type  :string(255)
#  verb        :string(255)
#  object_id   :integer
#  object_type :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Story < ActiveRecord::Base
	belongs_to :actor, polymorphic: true
	belongs_to :object, polymorphic: true

	def self.create_story(actor,object,verb,description='')
		Story.create(actor:actor, object: object, verb: verb, description: description)
	end
end
