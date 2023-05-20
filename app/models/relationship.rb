puts "\n☆★☆★☆\nmodels/relationship.rb\n☆★☆★☆\n\n"

class Relationship < ApplicationRecord
  puts "\n☆★☆★☆\nmodels/relationship.rb\nclass Relationship < ApplicationRecord\n☆★☆★☆\n\n"

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
