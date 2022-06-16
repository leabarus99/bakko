class Material < ApplicationRecord
  belongs_to :equipment
  belongs_to :activity
end
