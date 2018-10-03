json.extract! address, :id, :street_address, :road, :district, :city, :gps_latitude, :gps_longitude, :customer_id, :created_at, :updated_at
json.url address_url(address, format: :json)
