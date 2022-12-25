# frozen_string_literal: true

# class of model
class Gift < ApplicationRecord

  belongs_to :user
  belongs_to :wishlist_type
  #belongs_to :giver, class_name: 'User'

  validates :user_id, :name, :link, presence: true
end
