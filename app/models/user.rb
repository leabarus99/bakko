class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :photo
  has_many :trips, dependent: :destroy
  has_many :liikes, dependent: :destroy

  has_many :followed_users,
            foreign_key: :follower_id,
            class_name: "Relationship",
            dependent: :destroy

  has_many :followings, through: :followed_users, dependent: :destroy

  has_many :following_users,
            foreign_key: :following_id,
            class_name: "Relationship",
            dependent: :destroy

  has_many :followers, through: :following_users, dependent: :destroy


  def stories
    self.trips.map { |trip| trip.stories }.flatten
  end

end
