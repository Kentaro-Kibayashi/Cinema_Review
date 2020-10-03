class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(review)
    self.favorites.exists?(review_id: review.id)
  end

  validates :username, presence: true
end
