json.array!(@churches) do |church|
  json.extract! church, :id, :name, :address, :mission, :vision
  json.url church_url(church, format: :json)
end
