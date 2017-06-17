class Property < ApplicationRecord
  validates :beds, numericality: { greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 5 }

  validates :baths, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 4 }

  validates :square_meters, numericality: { greater_than_or_equal_to: 20,
                                            less_than_or_equal_to: 240 }
end
