class ProvincesByPropertyCoordinatesQuery < BaseQueryObject
  # @param relation [Province::ActiveRecord_Relation]
  # @param x [Integer]
  # @param y [Integer]
  def initialize(relation = Province.all, x:, y:)
    super(relation)
    @x = x
    @y = y
  end

  # @return [String]
  def query
    <<-SQL
      upper_left_boundary_x < #{@x} AND
      upper_left_boundary_y > #{@y} AND
      bottom_right_boundary_x > #{@x} AND
      bottom_right_boundary_y < #{@y}
    SQL
  end
end
