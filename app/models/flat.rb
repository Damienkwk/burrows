class Flat < ApplicationRecord
  belongs_to :user
  has_many :flat_amenities, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_and_belongs_to_many :amenities, through: :flat_amenities
  has_many_attached :photos
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
end
