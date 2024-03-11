class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  accepts_nested_attributes_for :ingredients
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 250, too_long: "%{count} characters is the maximum allowed" }
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :searching,
    associated_against: {
      ingredients: :name,
    },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }


  def get_rating
    return 0 if self.reviews.empty?
    reviews = self.reviews
    ratings_array = reviews.map { |review| review.rating  }
    return ratings_array.sum / ratings_array.length
  end
#   validates :description, presence: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 150, too_long: "%{count} characters is the maximum allowed" }
#   validates :method, presence: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 10000, too_long: "%{count} characters is the maximum allowed" }
#   validates :level, presence: true, inclusion: { in: %w(Easy Medium Hard), message: "%{value} is not a valid level" }
end
