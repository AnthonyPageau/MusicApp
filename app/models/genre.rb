class Genre < ApplicationRecord
  has_and_belongs_to_many :artists
  has_many :sub_genres
end
