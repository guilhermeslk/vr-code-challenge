require 'rails_helper'

RSpec.describe ProvincesByPropertyCoordinatesQuery do
  subject(:query_object) do
    described_class.new(x: x, y: y)
  end

  let(:x) { 667 }
  let(:y) { 556 }

  describe '#perform' do
    subject { query_object.perform }

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

  describe '#query' do
    subject { query_object.query }

    it do
      is_expected.to eq(
      <<-SQL
      upper_left_boundary_x < #{x} AND
      upper_left_boundary_y > #{y} AND
      bottom_right_boundary_x > #{x} AND
      bottom_right_boundary_y < #{y}
      SQL
      )
    end
  end
end
