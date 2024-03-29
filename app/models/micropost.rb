puts "\n☆★☆★☆\nmodels/micropost.rb\n☆★☆★☆\n\n"

class Micropost < ApplicationRecord
  puts "\n☆★☆★☆\nmodels/micropost.rb\nclass Micropost < ApplicationRecord\n☆★☆★☆\n\n"

  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], massage: "must be a valid image format" },
                      size: { less_than: 5.megabytes, message: "should be less than 5MB" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    puts "\n☆★☆★☆\nmodels/micropost.rb\nclass Micropost < ApplicationRecord\ndisplay_image method\n☆★☆★☆\n\n"

    image.variant(resize_to_limit: [500, 500])
  end
end
