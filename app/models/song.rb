class Song < ApplicationRecord
  belongs_to :genre,    optional: true
  belongs_to :composer, optional: true
end
