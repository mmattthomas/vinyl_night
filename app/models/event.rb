class Event < ActiveRecord::Base

	belongs_to :create_user, class_name: "User"
	has_many :attendees

	validates :create_user, presence: true
	validates :name, presence: true

end
