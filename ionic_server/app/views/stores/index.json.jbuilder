json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address, :zipcode, :city, :hours
  json.url store_url(store, format: :json)
end
