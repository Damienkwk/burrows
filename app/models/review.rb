class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :title, :content, :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  validates :content, length: { minimum: 20 }
end
