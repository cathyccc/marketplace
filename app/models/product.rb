class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  belongs_to :owner, class_name: "User"
  has_many :purchases
  has_many :buyers, through: :purchases

  validates :name,:description,:price_in_cents, :product_image, presence: true
  validates :price_in_cents, numericality: true, numericality: {greater_than: 0}

  mount_uploader :product_image, ProductImageUploader

  def convert_dollars
    price_in_cents / 100.00
  end

  def self.search(search)
    # same as 'Product.where(same as below)'
    where("name LIKE ?", "%#{search}%")
  end
end
