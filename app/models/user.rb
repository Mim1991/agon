class User < ApplicationRecord
  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def friends?
    self.friends
  end

  def friend_requests?
    self.requested_friends.any?
  end

  def requested_requests?
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
