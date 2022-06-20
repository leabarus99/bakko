class Story < ApplicationRecord
  belongs_to :trip
  has_many :liikes, dependent: :destroy
  has_one_attached :photo

  def author
    trip.user.full_name
  end
end
