class Attendee < ActiveRecord::Base

	belongs_to :event

	validates_presence_of :user_id, :event, :confirm_status

	scope :for_user_id, lambda {|query| where(["user_id = ?", "#{query.to_i}"])}

end
