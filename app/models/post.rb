class Post < ApplicationRecord
  belongs_to :user
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts
  accepts_nested_attributes_for :genre_posts, allow_destroy: true
  attachment :image
end
