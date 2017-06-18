class Province < ApplicationRecord
  has_many :locations
  has_many :properties, through: :locations

  validates_presence_of :name, :upper_left_boundary_x, :upper_left_boundary_y,
                        :bottom_right_boundary_x, :bottom_right_boundary_y

  def self.query_by_property_coordinates(x, y)
    where("upper_left_boundary_x < :x AND
           upper_left_boundary_y > :y AND
           bottom_right_boundary_x > :x AND
           bottom_right_boundary_y < :y", x: x, y: y)
  end

  def self.query_by_region_coordinates(ax:, ay:, bx:, by:)
    where("upper_left_boundary_x >= :ax AND
           upper_left_boundary_y <= :ay AND
           bottom_right_boundary_x <= :bx AND
           bottom_right_boundary_y >= :by", ax: ax, ay: ay, bx: bx, by: by)
  end
end
