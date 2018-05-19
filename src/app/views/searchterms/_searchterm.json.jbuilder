json.extract! searchterm, :id, :user_id, :search_term, :created_at, :updated_at
json.url searchterm_url(searchterm, format: :json)
