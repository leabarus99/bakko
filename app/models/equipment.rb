class Equipment < ApplicationRecord
  has_many :activities

  validates :name, presence: true
  validates :details, presence: true
  validates :product_img, presence: true
  validates :price_estimation, presence: true
end
