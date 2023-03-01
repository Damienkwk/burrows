class Amenity < ApplicationRecord
  has_many :flat_amenities
  has_many :flats, through: :flats_amenities
  enum :name, [ :television, :dryer, :shampoo ]
  enum :category, [ :entertainment, :toilet ]
end
