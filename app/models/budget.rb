class Budget < ApplicationRecord
  belongs_to :trip

  validates :price, presence: true
  validates :trip, presence: true
end
