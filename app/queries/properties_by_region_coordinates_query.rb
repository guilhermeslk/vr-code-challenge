class PropertiesByRegionCoordinatesQuery < BaseQueryObject
  # @param relation [Province::ActiveRecord_Relation]
  # @param ax [Integer] Upper left boundary X
  # @param ay [Integer] Upper left boundary Y
  # @param bx [Integer] Bottom right boundary X
  # @param by [Integer] Bottom right boundary Y
  def initialize(relation = Property.all, ax:, ay:, bx:, by:)
    super(relation)
    @ax = ax
    @ay = ay
    @bx = bx
    @by = by
  end

  def perform
    provinces_ids = provinces_by_region_coordinates_query.perform.pluck(:id)

    relation.joins(:provinces)
            .where('provinces.id IN (:ids)', ids: provinces_ids)
  end

  # @return [ProvincesByRegionCoordinatesQuery]
  def provinces_by_region_coordinates_query
    ProvincesByRegionCoordinatesQuery.new(ax: @ax, ay: @ay, bx: @bx, by: @by)
  end
end
