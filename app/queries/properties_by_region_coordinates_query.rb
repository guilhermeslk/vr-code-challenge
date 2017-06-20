class PropertiesByRegionCoordinatesQuery < BaseQueryObject
  # @param relation [Property::ActiveRecord_Relation]
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

  # @return [Property::ActiveRecord_Relation]
  def perform
    relation.joins(:provinces).where(query, provinces_ids: provinces_ids)
  end

  # @return [String]
  def query
    'provinces.id IN (:provinces_ids)'
  end

  private

  def provinces_ids
    provinces_by_region_coordinates_query.perform.pluck(:id)
  end

  # @return [ProvincesByRegionCoordinatesQuery]
  def provinces_by_region_coordinates_query
    ProvincesByRegionCoordinatesQuery.new(ax: @ax, ay: @ay, bx: @bx, by: @by)
  end
end
