FactoryGirl.define do
  factory :province do
    name { Faker::Lorem.word }
    upper_left_boundary_x { Faker::Number.between(0, 1400) }
    upper_left_boundary_y { Faker::Number.between(0, 1000) }
    bottom_right_boundary_x { Faker::Number.between(0, 1400)  }
    bottom_right_boundary_y { Faker::Number.between(0, 1000) }

    trait :gode do
      name { 'Gode' }
      upper_left_boundary_x { 0 }
      upper_left_boundary_y { 1000 }
      bottom_right_boundary_x { 600 }
      bottom_right_boundary_y { 500 }
    end

    trait :ruja do
      name { 'Ruja' }
      upper_left_boundary_x { 400 }
      upper_left_boundary_y { 1000 }
      bottom_right_boundary_x { 1100 }
      bottom_right_boundary_y { 500 }
    end

    trait :jaby do
      name { 'Jaby' }
      upper_left_boundary_x { 1100 }
      upper_left_boundary_y { 1000 }
      bottom_right_boundary_x { 1400 }
      bottom_right_boundary_y { 500 }
    end

    trait :scavy do
      name { 'Scavy' }
      upper_left_boundary_x { 0 }
      upper_left_boundary_y { 500 }
      bottom_right_boundary_x { 600 }
      bottom_right_boundary_y { 0 }
    end

    trait :groola do
      name { 'Groola' }
      upper_left_boundary_x { 600 }
      upper_left_boundary_y { 500 }
      bottom_right_boundary_x { 800 }
      bottom_right_boundary_y { 0 }
    end

    trait :nova do
      name { 'Nova' }
      upper_left_boundary_x { 800 }
      upper_left_boundary_y { 500 }
      bottom_right_boundary_x { 1400 }
      bottom_right_boundary_y { 0 }
    end
  end
end
