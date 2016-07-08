json.array!(@petitions) do |petition|
  json.extract! petition, :id, :category, :title, :message, :status, :church_id, :user_id
  json.url petition_url(petition, format: :json)
end
