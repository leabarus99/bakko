class Material < ApplicationRecord
  belongs_to :equipment
  belongs_to :activity
  has_one_attached :photo

end
