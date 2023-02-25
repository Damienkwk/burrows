class Flat < ApplicationRecord
  belongs_to :user
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
end
