json.extract! subimg, :id, :url, :product_id, :created_at, :updated_at
json.url subimg_url(subimg, format: :json)
