class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :name,:description,:price_in_cents, presence: true

  mount_uploader :product_image, ProductImageUploader

  def convert_dollars
    price_in_cents / 100.00
  end
end
