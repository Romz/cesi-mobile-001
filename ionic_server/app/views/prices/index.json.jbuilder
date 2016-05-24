json.array!(@prices) do |price|
  json.extract! price, :id, :name, :product_id, :store_id, :price
  json.url price_url(price, format: :json)
end
