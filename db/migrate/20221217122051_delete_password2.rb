# frozen_string_literal: true

class DeletePassword2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :digest_password
    add_column :users, :password_digest, :string
  end
end
