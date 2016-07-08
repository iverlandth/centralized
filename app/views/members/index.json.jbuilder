json.array!(@members) do |member|
  json.extract! member, :id, :first_name, :middle_name, :last_name, :date_of_birth, :cellphone, :telephone, :address, :status, :church_id
  json.url member_url(member, format: :json)
end
