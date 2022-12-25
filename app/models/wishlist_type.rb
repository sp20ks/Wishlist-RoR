class WishlistType < ApplicationRecord
    has_many :gifts, dependent: :destroy
end
