class Property < ApplicationRecord
  before_save :set_locations, on: [:create]

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

  private

  def set_locations
    self.provinces = ProvincesByPropertyCoordinatesQuery.new(x: x, y: y).perform
  end
end
