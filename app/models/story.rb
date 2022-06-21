class Story < ApplicationRecord
  belongs_to :trip
  has_many :liikes, dependent: :destroy
  has_one_attached :photo

  def author
    trip.user.full_name
  end

  def like_from_user(user)
    self.liikes.find { |like| like.user == user}
  end
end
