require 'rails_helper'

RSpec.describe Province, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:upper_left_boundary_x) }
  it { should validate_presence_of(:upper_left_boundary_y) }
  it { should validate_presence_of(:bottom_right_boundary_x) }
  it { should validate_presence_of(:bottom_right_boundary_y) }

  describe '.query_by_property_coordinates' do
    subject { described_class.query_by_property_coordinates(x, y) }

    let(:x) { 667 }
    let(:y) { 556 }

    let(:province_1) do
      create :province,
             upper_left_boundary_x: 400,
             upper_left_boundary_y: 1000,
             bottom_right_boundary_x: 1100,
             bottom_right_boundary_y: 500
    end

    it { is_expected.to eq [province_1] }

    context 'when property is outside Spotippos borders' do
      let(:x) { 1500 }
      let(:y) { 1100 }

      it { is_expected.to eq [] }
    end
  end
end
