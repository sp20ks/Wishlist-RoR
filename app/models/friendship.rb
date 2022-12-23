# frozen_string_literal: true

# class of model
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true

  def friends?(user1, user2)
    Friendship.where(user_id: user1, friend_id: user2) && Friendship.where(user_id: user2, friend_id: user1)
  end

  def request_present?(user1, user2)
    (!Friendship.where(user_id: user1, friend_id: user2).empty? ^ !Friendship.where(user_id: user2, friend_id: user1).empty?)
  end
  #after_create_commit -> { broadcast_prepend_to "friendships", partial: "friendships/new", locals: { friendship: self }, target: "friendships" }
end
