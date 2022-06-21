class Guide < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_category,
    against: %i[title category],
      using: {
        tsearch: { prefix: true } }

  has_one_attached :photo
end
