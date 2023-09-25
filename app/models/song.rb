class Song < ApplicationRecord
  belongs_to :sub_genre, foreign_key: :sub_genre_id
  belongs_to :artist, foreign_key: :artist_id
end
