# frozen_string_literal: true

class AddForeignKeyToGift < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :wishlist_type_id, :integer, foreign_key: true
  end
end
