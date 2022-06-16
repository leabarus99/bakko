class Trip < ApplicationRecord
  belongs_to :user
  has_many :stories
  has_many :trip_activities
  has_many :activities, through: :trip_activities
end
