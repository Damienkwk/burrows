class FlatAmenity < ApplicationRecord
  belongs_to :flat
  belongs_to :amenity
  validates :amenity, uniqueness: true
end
