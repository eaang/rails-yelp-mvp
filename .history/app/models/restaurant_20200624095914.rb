class Restaurant < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :addresss, presence: true
  validates :category, presence: true
end
