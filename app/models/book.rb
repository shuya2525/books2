class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    if image.attached?
      image
    else
      'abcd.jpg'
    end
  end
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}
end
