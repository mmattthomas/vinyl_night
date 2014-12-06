class Attendee < ActiveRecord::Base

	belongs_to :event

	validates_presence_of :user, :event, :confirm_status

end
