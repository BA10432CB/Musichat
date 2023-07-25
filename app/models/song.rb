class Song < ApplicationRecord
  belongs_to :genre,    optional: true
  belongs_to :composer, optional: true

  validates :name,     presence: true
  validates :genre,    presence: true
  validates :composer, presence: true
end
