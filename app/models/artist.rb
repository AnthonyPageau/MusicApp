class Artist < ApplicationRecord
  has_and_belongs_to_many :sub_genres
  has_and_belongs_to_many :genres
end
