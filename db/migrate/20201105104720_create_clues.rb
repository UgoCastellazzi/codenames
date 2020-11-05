class CreateClues < ActiveRecord::Migration[6.0]
  def change
    create_table :clues do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :number_clue
      t.string :word_clue
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
