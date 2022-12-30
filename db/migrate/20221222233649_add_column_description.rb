# frozen_string_literal: true

class AddColumnDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :description, :string
  end
end
