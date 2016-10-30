class Product < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name,:description,:price_in_cents, presence: true
end
