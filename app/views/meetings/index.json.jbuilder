json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :type_meeting, :day, :meeting_start_at, :meeting_end_at, :address, :status, :church_id, :user_id
  json.url meeting_url(meeting, format: :json)
end
