class Genre < ApplicationRecord
  has_many :songs
  has_many :posts

  validates :name, presence: true
end
