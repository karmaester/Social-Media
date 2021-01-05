class User < ApplicationRecord
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.status }
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def not_friend?(user)
    pending_friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (friends << self)).ordered_by_most_recent
  end

  def user_friend
    current_user.friend?(user) || user.friend?(current_user)
  end

  def user_not_friend
    current_user.not_friend?(user) || user.not_friend?(current_user)
  end
end
