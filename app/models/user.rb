class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  validates :name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 2, maximum: 20 }
end
