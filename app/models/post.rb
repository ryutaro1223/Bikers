class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :likes, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    if search
    Post.where(["post_name like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
    else
      Post.all
    end
  end

  accepts_nested_attributes_for :genre_posts, allow_destroy: true
  attachment :image
end
