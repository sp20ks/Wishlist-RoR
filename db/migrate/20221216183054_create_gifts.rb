class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :link
      t.belongs_to :user, foreign_key: true
      t.belongs_to :giver

      t.timestamps
    end
  end
end
