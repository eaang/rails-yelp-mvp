class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  def average_rating
    rating = []
    all_reviews.each { |review| rating << review.rating }
    rating = (rating.sum(0.0) / rating.size)
    rating.nan? ? ('no reviews yet!') : rating
  end

  def all_reviews
    Review.where(restaurant_id: id)
  end
end
