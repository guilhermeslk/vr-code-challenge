json.key_format! camelize: :lower

json.extract! @property, :id, :title, :price, :description, :x, :y,
              :beds, :baths

json.provinces @property.provinces.pluck(:name)
json.extract! @property, :square_meters
