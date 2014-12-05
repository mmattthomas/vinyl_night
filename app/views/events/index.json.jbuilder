json.array!(@events) do |event|
  json.extract! event, :id, :name, :create_user_id, :scheduled, :start_time, :end_time, :address, :description
  json.url event_url(event, format: :json)
end
