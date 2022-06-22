class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :photo
  has_many :trips, dependent: :destroy
  has_many :liikes, dependent: :destroy


  def stories
    self.trips.map { |trip| trip.stories }.flatten
  end

end
