class Bed < ApplicationRecord
  belongs_to :room
  validates :category, presence: true
  CATEGORIES = ["Double bed", "Sofa bed", "Single bed"]
end
