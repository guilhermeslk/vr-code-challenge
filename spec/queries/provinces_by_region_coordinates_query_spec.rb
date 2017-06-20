require 'rails_helper'

RSpec.describe ProvincesByRegionCoordinatesQuery do
  subject(:query_object) do
    described_class.new(
      ax: ax,
      ay: ay,
      bx: bx,
      by: by
    )
  end

  let(:ax) { 0 }
  let(:ay) { 1000 }
  let(:bx) { 1400 }
  let(:by) { 0 }

  describe '#perform' do
    subject { query_object.perform }

    let(:gode) { create :province, :gode }
    let(:ruja) { create :province, :ruja }
    let(:jaby) { create :province, :jaby }
    let(:scavy) { create :province, :scavy }
    let(:groola) { create :province, :groola }
    let(:nova) { create :province, :nova }

    it { is_expected.to eq [gode, ruja, jaby, scavy, groola, nova] }

    context 'when a smaller region is provided' do
      let(:ax) { 0 }
      let(:ay) { 500 }
      let(:bx) { 1400 }
      let(:by) { 0 }

      it { is_expected.to eq [scavy, groola, nova] }
    end

    context 'when coordinates of a single region are provided' do
      let(:ax) { 0 }
      let(:ay) { 1000 }
      let(:bx) { 600 }
      let(:by) { 500 }

      it { is_expected.to eq [gode] }
    end

    context 'when invalid coordinates are provided' do
      let(:ax) { 9999 }
      let(:ay) { 9999 }
      let(:bx) { 9999 }
      let(:by) { 9999 }

      it { is_expected.to be_empty }
    end
  end

  describe '#query' do
    subject { query_object.query }

    it do
      is_expected.to eq(
      <<-SQL
      upper_left_boundary_x >= #{ax}
      AND upper_left_boundary_y <= #{ay}
      AND bottom_right_boundary_x <= #{bx}
      AND bottom_right_boundary_y >= #{by}
      SQL
      )
    end
  end
end
