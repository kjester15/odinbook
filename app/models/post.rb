class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  validates :content, length: {maximum: 500}

  validate :image_or_content?

  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.blob.byte_size <= 1.megabyte
      errors.add(:image, "must be less than 1 MB.")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPG or PNG.")
    end
  end

  def image_or_content?
    return unless content.empty? && !image.attached?

    errors.add(:post, "must contain text or an image.")
  end
end
