require 'rails_helper'

RSpec.describe Province, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:upper_left_boundary_x) }
  it { should validate_presence_of(:upper_left_boundary_y) }
  it { should validate_presence_of(:bottom_right_boundary_x) }
  it { should validate_presence_of(:bottom_right_boundary_y) }
end
