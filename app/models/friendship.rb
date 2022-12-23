# frozen_string_literal: true

# class of model
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true
  #after_create_commit -> { broadcast_prepend_to "friendships", partial: "friendships/new", locals: { friendship: self }, target: "friendships" }
end
