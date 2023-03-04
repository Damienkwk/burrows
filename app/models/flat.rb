class Flat < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
end
