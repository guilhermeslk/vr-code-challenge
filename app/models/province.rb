class Province < ApplicationRecord
  has_many :locations
  has_many :properties, through: :locations

  validates_presence_of :name, :upper_left_boundary_x, :upper_left_boundary_y,
                        :bottom_right_boundary_x, :bottom_right_boundary_y
end
