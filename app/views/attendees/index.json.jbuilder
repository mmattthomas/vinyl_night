json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :user_id, :confirm_status, :bring_vinyl, :bring_drinks, :bring_food, :bring_theparty, :event_id, :comments
  json.url attendee_url(attendee, format: :json)
end
