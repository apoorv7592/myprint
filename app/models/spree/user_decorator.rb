Spree::User.class_eval do
	devise :confirmable
	has_one :designer
	has_many :entries
end