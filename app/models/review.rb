class Review < ApplicationRecord
  belongs_to :recipe
  validates :comment, presence: true
  validates :rating, presence: true
end
