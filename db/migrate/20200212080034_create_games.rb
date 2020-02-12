class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :name
      t.string :console
      t.integer :release_date
      t.string :details
      t.timestamps null: false
    end
  end
end
