class Post < ApplicationRecord

  validates :description, {presence: true, length: {minimum: 70}}
  validates :title, {presence: true, length: {minimum: 5}}
  validates :image, {presence: true}
  validates :date, {presence: true}
  validates :time, {presence: true}
  validates :place, {presence: true}
  validates :address, {presence: true}
  validates :price, {presence: true}


  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :group_users, dependent: :destroy
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_one_attached :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end





end
