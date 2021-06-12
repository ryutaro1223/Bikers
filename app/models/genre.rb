class Genre < ApplicationRecord
  has_many :genre_posts
  has_many :posts, through: :genre_posts
end
