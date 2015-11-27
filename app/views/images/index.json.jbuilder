json.array!(@images) do |image|
  json.extract! image, :id, :gallery_id, :name, :description
  json.url image_url(image, format: :json)
end
