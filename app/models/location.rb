class Location < ApplicationRecord
  belongs_to :property
  belongs_to :province
 end
