class Post < ApplicationRecord
  belongs_to :user
  has_many   :post_comments, dependent: :destroy
  has_many   :favorites,     dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :body,  presence: true
  validates :star,  presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    @post = Post.where("title LIKE?","%#{word}%")
  end
end
