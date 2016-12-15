class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :review_text, presence: true

  after_destroy :log_destroy_action

  def writer
    user.username
  end

  def log_destroy_action
    puts "Article destroyed"
  end
end
