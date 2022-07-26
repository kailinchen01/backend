json.extract! profile_photo, :id, :file, :created_at, :updated_at
json.url profile_photo_url(profile_photo, format: :json)
