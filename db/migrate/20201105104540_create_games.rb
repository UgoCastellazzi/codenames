class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :words
      t.references :player_one, foreign_key: { to_table: 'users' }
      t.references :player_two, foreign_key: { to_table: 'users' }
      t.boolean :winner

      t.timestamps
    end
  end
end
