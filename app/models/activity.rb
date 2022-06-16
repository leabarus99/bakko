class Activity < ApplicationRecord
  ACTIVITIES = ["hiking", "climbing", "surf", "scuba diving", "sightseeing", "biking"]

  has_many :trip_activities
  has_many :trips, through: :trip_activities

  has_many :materials
  has_many :equipments, through: :materials
end
