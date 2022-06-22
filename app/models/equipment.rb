class Equipment < ApplicationRecord
  has_many :materials
  has_many :activities, through: :materials
  has_one_attached :photo


  validates :name, presence: true
  validates :details, presence: true
  validates :price_estimation, presence: true
end
