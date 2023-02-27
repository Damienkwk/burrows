class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :user, uniqueness: { scope: :flat }
end
