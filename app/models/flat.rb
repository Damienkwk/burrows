class Flat < ApplicationRecord
  belongs_to :user
  has_many :flat_amenities, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :amenities, through: :flat_amenities
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
  has_many :reviews, through: :bookings
end
