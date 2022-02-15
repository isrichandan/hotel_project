json.extract! room, :id, :user_name, :mob, :address, :created_at, :updated_at
json.url room_url(room, format: :json)
