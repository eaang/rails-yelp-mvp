class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  def average_rating
    reviews = all_reviews
    rating = []
    reviews.each { |review| rating << review.rating }
    (rating.sum(0.0) / rating.size)
  end

  def all_reviews
    Review.where(restaurant_id: id)
  end
end
