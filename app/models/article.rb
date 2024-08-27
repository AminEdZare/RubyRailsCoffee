class Article < ApplicationRecord
  include Visible

  has_one_attached :coffee_cup do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 400]
  end
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
