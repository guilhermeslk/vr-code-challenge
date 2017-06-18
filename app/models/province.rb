class Province < ApplicationRecord
  has_many :locations
  has_many :properties, through: :locations

  def self.query_by_coordinates(x, y)
    where("upper_left_boundary_x < :x AND
           upper_left_boundary_y > :y AND
           bottom_right_boundary_x > :x AND
           bottom_right_boundary_y < :y", x: x, y: y)
  end
end
