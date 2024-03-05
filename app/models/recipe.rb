class Recipe < ApplicationRecord
  belongs_to :user

  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 250, too_long: "%{count} characters is the maximum allowed" }
  validates :description, presence: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 150, too_long: "%{count} characters is the maximum allowed" }
  validates :method, presence: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 10000, too_long: "%{count} characters is the maximum allowed" }
  validates :level, presence: true, inclusion: { in: %w(Easy Medium Hard), message: "%{value} is not a valid level" }

end
