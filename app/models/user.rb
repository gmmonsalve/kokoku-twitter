class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :tweets, dependent: :destroy

#  has_many :followed_users, foreign_key: :follower, class_name:
#   "Follow"
#   has_many :followedd, through: :followed_users

#   has_many :following_users, foreign_key: :followed, class_name:
#   "Follow"
#   has_many :followers, through: :following_users

   has_and_belongs_to_many :users_following,
                           class_name: "User",
                           join_table: :follows,
                           foreign_key: :follower,
                           association_foreign_key: :followed

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  def is_following?(user)
    self.users_following.include? user
  end

  def follow(user)
    self.users_following << user
  end

  def unfollow(user)
    self.users_following.destroy user
  end

  def get_followers
    User.joins('JOIN follows ON follows.follower = users.id').where(['followed = ?', self.id])
  end

end
