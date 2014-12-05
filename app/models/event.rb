class Event < ActiveRecord::Base

	belongs_to :create_user, class_name: "User"

	validates :create_user, presence: true
	validates :name, presence: true

end
