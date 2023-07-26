class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_active == true)
  end

  has_many :posts,         dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites,     dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers,  through: :reverse_of_relationships, source: :follower
  has_many :relationships,            class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships,            source: :followed

  has_one_attached :profile_image

  validates :name,         presence: true
  validates :phone_number, presence: true

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.png'
  end

  def self.looks(search, word)
    @user = User.where("name LIKE?","%#{word}%")
  end

  GUEST_USER_EMAIL = "guest@example.com"
  GUEST_USER_PHONE_NUMBER = "00000000000"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL, phone_number: GUEST_USER_PHONE_NUMBER) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end
end
