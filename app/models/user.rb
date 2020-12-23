class User < ApplicationRecord
  has_friendship
  has_many :scores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }

  def friends?
    self.friends
  end

  def friend_requests?
    self.requested_friends.any?
  end

  def requested_friends?
    self.pending_friends.any?
  end

  def invite_friend(user)
    self.friend_request(user)
  end

  def not_friends
    strangers = []
    User.all.each do |user|
      if (self.friends_with?(user) != true && self != user && self.friends.inlcude?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
        strangers << user
      end
    end
    strangers
  end
end
