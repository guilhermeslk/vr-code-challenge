json.key_format! camelize: :lower

json.extract! @property, :id, :title, :price, :description, :x, :y,
              :beds, :baths, :square_meters, :created_at, :updated_at
