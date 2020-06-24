class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  # def average_rating
  #   reviews = Review.where(restaurant_id: self.id)
  #   rating = []
  #   reviews.each { |review| rating << review.rating }
  #   return (rating.sum(0.0) / rating.size)
  # end
end