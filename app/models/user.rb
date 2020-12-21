class User < ApplicationRecord
  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
