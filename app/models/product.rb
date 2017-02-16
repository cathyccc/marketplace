class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :order_items
  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :name,:description,:price_in_cents, :product_image, presence: true
  validates :price_in_cents, numericality: true, numericality: {greater_than: 0}

  mount_uploader :product_image, ProductImageUploader
  attr_accessible :product_image

  def convert_dollars
    price_in_cents / 100.00
  end

  def self.search(search)
    # same as 'Product.where(same as below)'
    where("name LIKE ?", "%#{search}%")
  end
end
