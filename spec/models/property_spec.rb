require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should validate_numericality_of(:beds).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:beds).is_less_than_or_equal_to(5) }

  it { should validate_numericality_of(:baths).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:baths).is_less_than_or_equal_to(4) }

  it do
    should validate_numericality_of(:square_meters)
      .is_greater_than_or_equal_to(20)
  end

  it do
    should validate_numericality_of(:square_meters)
      .is_less_than_or_equal_to(240)
  end
end
