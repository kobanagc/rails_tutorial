puts "\n☆★☆★☆\nmodels/user.rb\n☆★☆★☆\n\n"

class User < ApplicationRecord
  puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\n☆★☆★☆\n\n"

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  class << self
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nclass << self\n☆★☆★☆\n\n"

    # 渡された文字列のハッシュ値（複合不可の暗号）を返す
    def digest(string)
      puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nclass << self\ndigest method\n☆★☆★☆\n\n"

      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine::cost
      BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def new_token
      puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nclass << self\nnew_token method\n☆★☆★☆\n\n"

      SecureRandom.urlsafe_base64
    end
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nremember method\n☆★☆★☆\n\n"

    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nauthenticated? method\n☆★☆★☆\n\n"

    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nforget method\n☆★☆★☆\n\n"

    update_attribute(:remember_digest, nil)
  end

  # アカウントを有効にする
  def activate
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nactivate method\n☆★☆★☆\n\n"

    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nsend_activation_email method\n☆★☆★☆\n\n"

    UserMailer.account_activation(self).deliver_now
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\ncreate_reset_digest method\n☆★☆★☆\n\n"

    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nsend_password_reset_email method\n☆★☆★☆\n\n"

    UserMailer.password_reset(self).deliver_now
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\npassword_reset_expired? method\n☆★☆★☆\n\n"

    reset_sent_at < 2.hours.ago
  end

  #ユーザーのステータスフィードを返す
  def feed
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nfeed method\n☆★☆★☆\n\n"

    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  # ユーザーをフォローする
  def follow(other_user)
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nfollow method\n☆★☆★☆\n\n"

    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nunfollow method\n☆★☆★☆\n\n"

    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\nfollowing? method\n☆★☆★☆\n\n"

    following.include?(other_user)
  end

  private

  def downcase_email
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\ndowncase_email method (private)\n☆★☆★☆\n\n"

    self.email.downcase!
  end

  def create_activation_digest
    puts "\n☆★☆★☆\nmodels/user.rb\nclass User < ApplicationRecord\ncreate_activation_digest method (private)\n☆★☆★☆\n\n"

    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end