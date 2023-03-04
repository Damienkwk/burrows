class Room < ApplicationRecord
  belongs_to :flat

  validates :name, presence: true, inclusion: { in: ["Bedroom", "Living Room"]}
end
