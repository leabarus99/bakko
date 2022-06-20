class Story < ApplicationRecord
  belongs_to :trip
  has_one_attached :photo
  has_many :liikes

  def author
    trip.user.full_name
  end
end
