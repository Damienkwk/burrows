class Amenity < ApplicationRecord
  has_many :flats
  has_and_belongs_to_many :flats, through: :flat_amenities
end
