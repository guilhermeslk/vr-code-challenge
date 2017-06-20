require 'rails_helper'

RSpec.describe ProvincesByPropertyCoordinatesQuery do
  subject(:query) do
    described_class.new(x: x, y: y)
  end

  describe '#perform' do
    subject { query.perform }

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
