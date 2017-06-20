require 'rails_helper'

RSpec.describe PropertiesByRegionCoordinatesQuery do
  subject(:query) do
    described_class.new(
      ax: ax,
      ay: ay,
      bx: bx,
      by: by
    )
  end

  let(:ax) { 999 }
  let(:ay) { 999 }
  let(:bx) { 999 }
  let(:by) { 999 }

  describe '#perform' do
    subject { query.perform }

    let!(:location_1) do
      create :location, property: property_1, province: province_1
    end

    let!(:location_2) do
      create :location, property: property_2, province: province_2
    end

    let(:province_1) { create :province }
    let(:province_2) { create :province }
    let(:property_1) { create :property }
    let(:property_2) { create :property }

    let(:provinces_ids) { [province_1.id, province_2.id] }
    let(:provinces_by_region_coordinates_query) do
      instance_spy ProvincesByRegionCoordinatesQuery
    end
    let(:relation) { double :relation, pluck: provinces_ids }

    before do
      allow(ProvincesByRegionCoordinatesQuery)
        .to receive(:new)
        .with(ax: ax, ay: ay, bx: bx, by: by)
        .and_return(provinces_by_region_coordinates_query)
      allow(provinces_by_region_coordinates_query)
        .to receive(:perform)
        .with(no_args)
        .and_return(relation)
    end

    it { is_expected.to eq [property_1, property_2] }
  end
end
