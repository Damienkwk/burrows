class Room < ApplicationRecord
  belongs_to :flat
  has_many :beds, dependent: :destroy

  validates :name, presence: true, inclusion: { in: ["Bedroom", "Living Room"]}
end
