FactoryGirl.define do
  factory :property do
    x { Faker::Number.between(0, 1400) }
    y { Faker::Number.between(0, 1000) }
    title { Faker::Lorem.sentence }
    price { Faker::Number.decimal(8) }
    description { Faker::Lorem.paragraph }
    beds { Faker::Number.between(1, 5) }
    baths  { Faker::Number.between(1, 4) }
    square_meters { Faker::Number.between(20, 240) }
  end
end
