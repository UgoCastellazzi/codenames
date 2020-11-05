class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :words
      t.references :player_one_id, null: false, foreign_key: { to_table: 'users' }
      t.references :player_two_id, null: false, foreign_key: { to_table: 'users' }
      t.boolean :winner

      t.timestamps
    end
  end
end
