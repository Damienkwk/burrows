class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :start_date, :end_date, :number_of_guests, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  STATUSES = %w[pending approved rejected].freeze
  has_many :reviews, dependent: :destroy
end
