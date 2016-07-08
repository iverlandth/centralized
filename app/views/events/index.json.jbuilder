json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :event_start_at, :event_end_at, :address, :status, :church_id, :user_id
  json.url event_url(event, format: :json)
end
