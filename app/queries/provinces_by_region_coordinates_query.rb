class ProvincesByRegionCoordinatesQuery < BaseQueryObject
  # @param relation [Province::ActiveRecord_Relation]
  # @param ax [Integer] Upper left boundary X
  # @param ay [Integer] Upper left boundary Y
  # @param bx [Integer] Bottom right boundary X
  # @param by [Integer] Bottom right boundary Y
  def initialize(relation = Province.all, ax:, ay:, bx:, by:)
    super(relation)
    @ax = ax
    @ay = ay
    @bx = bx
    @by = by
  end

  # @return [String]
  def query
    <<-SQL
      upper_left_boundary_x >= #{@ax}
      AND upper_left_boundary_y <= #{@ay}
      AND bottom_right_boundary_x <= #{@bx}
      AND bottom_right_boundary_y >= #{@by}
    SQL
  end
end
