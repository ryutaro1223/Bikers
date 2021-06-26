class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :likes, source: :user

  validates :post_name, presence: true, length: {maximum: 50 }
  validates :caption, presence: true, length: {maximum: 150 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
    Post.where(["post_name like? OR caption like?", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end

  accepts_nested_attributes_for :genre_posts, allow_destroy: true
  attachment :image
end
