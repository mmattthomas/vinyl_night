class Attendee < ActiveRecord::Base

	belongs_to :event
	belongs_to :user

	validates_presence_of :user_id, :event, :confirm_status

	scope :for_user_id, lambda {|query| where(["user_id = ?", "#{query.to_i}"])}
	scope :responded_yes, lambda { where(["substring(confirm_status from 1 for 1) = 'Y'"])}
	scope :responded_no, lambda { where(["substring(confirm_status from 1 for 1) = 'N'"])}
	scope :responded_maybe, lambda { where(["substring(confirm_status from 1 for 1) = 'M'"])}

end
