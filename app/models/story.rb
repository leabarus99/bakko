class Story < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
  against: %i[title location],
    using: {
      tsearch: { prefix: true } }


  belongs_to :trip
  has_one :user, through: :trip
  has_many :liikes, dependent: :destroy
  has_one_attached :photo


  def author
    trip.user.full_name
  end

  def like_from_user(user)
    self.liikes.find { |like| like.user == user}
  end
end
