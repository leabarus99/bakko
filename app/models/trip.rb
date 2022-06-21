class Trip < ApplicationRecord
  belongs_to :user
  has_many :stories
  # has_many :budgets, dependent: :destroy
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end

