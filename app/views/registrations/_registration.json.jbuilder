json.extract! registration, :id, :run_id, :user_id, :confirmed, :created_at, :updated_at
json.url registration_url(registration, format: :json)
