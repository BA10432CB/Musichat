class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_active == true)
  end

  has_many :posts, dependent: :destroy

  has_one_attached :profile_image

  validates :name,         presence: true
  validates :phone_number, presence: true
end
