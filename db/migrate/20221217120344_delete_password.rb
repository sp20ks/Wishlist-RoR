# frozen_string_literal: true

class DeletePassword < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_digest
    add_column :users, :digest_password, :string
  end
end
