json.extract! blog, :id, :created_at, :updated_at
json.url blogs_url(blog, format: :json)
