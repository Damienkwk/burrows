class Amenity < ApplicationRecord
  has_many :flats
  has_many :flats, through: :flat_amenities
end
