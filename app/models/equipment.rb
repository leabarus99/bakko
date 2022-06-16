class Equipment < ApplicationRecord
  has_many :materials
  has_many :activities, through: :materials


  validates :name, presence: true
  validates :details, presence: true
  validates :price_estimation, presence: true
end
