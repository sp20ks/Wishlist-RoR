# frozen_string_literal: true

# model
class WishlistType < ApplicationRecord
  has_many :gifts, dependent: :destroy
end
