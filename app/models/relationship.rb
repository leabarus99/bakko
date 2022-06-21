class Relationship < ApplicationRecord
  belong_to :follower, class_name: 'User'
  belong_to :following, class_name: 'User'
end
