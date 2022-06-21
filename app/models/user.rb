class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :photo
  has_many :trips, dependent: :destroy
  has_many :likes, dependent: :destroy
  # def full_name
  #   slef.first_name.cap
  # end

  def stories
    self.trips.map { |trip| trip.stories }.flatten
  end
end
