class Room < ApplicationRecord
  belongs_to :flat

  validates :name, presence: true
end
