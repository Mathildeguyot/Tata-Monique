json.array! @users do |user|
  json.extract! user, :id, :first_name, :last_name, :birth_date, :phone_number, :ID_number, :nationality, :birth_location, :email
end
