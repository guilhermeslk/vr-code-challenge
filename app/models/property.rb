class Property < ApplicationRecord
  after_validation :set_locations, on: [:create]

  has_many :locations
  has_many :provinces, through: :locations

  validates_presence_of :x, :y, :title, :price, :description,
                        :beds, :baths, :square_meters

  validates :beds, numericality: { greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 5 }

  validates :baths, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 4 }

  validates :square_meters, numericality: { greater_than_or_equal_to: 20,
                                            less_than_or_equal_to: 240 }
  validates_with SpotipposBordersValidator,
                 if: proc { |record| record.x.present? && record.y.present? }

  def self.query_by_region_coordinates(ax:, ay:, bx:, by:)
    regions_ids = Province.query_by_region_coordinates(ax: ax, ay: ay, bx: bx, by: by).pluck(:id)

    joins(:provinces).where("provinces.id IN (:ids)", ids: regions_ids)
  end

  private

  def set_locations
    self.provinces = Province.query_by_property_coordinates(x, y)
  end
end
