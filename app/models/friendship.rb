# frozen_string_literal: true

# class of model
class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true
end
