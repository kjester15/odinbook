class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # follower_follows "names" the Follow join table for accessing through the follower association
  has_many :follower_follows, foreign_key: "followee_id", class_name: "Follow", dependent: :destroy
  # source: :follower matches with the belong_to :follower identification in the Follow model
  has_many :followers, through: :follower_follows, source: :follower, dependent: :destroy
  # followee_follows "names" the Follow join table for accessing through the followee association
  has_many :followee_follows, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  # source: :followee matches with the belong_to :followee identification in the Follow model
  has_many :followees, through: :followee_follows, source: :followee, dependent: :destroy

  has_one_attached :avatar

  validate :acceptable_avatar

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.blob.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20],
                         image: data['image'],
                         username: data['email'].split('@')[0])
    end
    user
  end
end
