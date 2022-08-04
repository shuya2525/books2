class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'abcd.jpg'
    end
  end
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :profile_image
  
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20}, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
