# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :login
      t.string :digest_password
      t.string :email
      t.date :birth

      t.timestamps
    end
  end
end
