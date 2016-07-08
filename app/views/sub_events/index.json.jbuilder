json.array!(@sub_events) do |sub_event|
  json.extract! sub_event, :id, :name, :description, :sub_event_start_at, :sub_event_end_at, :place, :event_id
  json.url sub_event_url(sub_event, format: :json)
end
