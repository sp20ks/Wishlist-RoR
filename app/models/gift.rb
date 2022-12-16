# frozen_string_literal: true

# class of model
class Gift < ApplicationRecord

  belongs_to :user
  belongs_to :owner, class_name: 'User'

  validates :user, presence: true
end
