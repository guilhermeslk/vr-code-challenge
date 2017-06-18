json.found_properties @properties.count

json.properties @properties do |property|
  json.extract! property, :id, :title, :price, :description, :x, :y,
                :beds, :baths

  json.provinces property.provinces.pluck(:name)
  json.extract! property, :square_meters
end
