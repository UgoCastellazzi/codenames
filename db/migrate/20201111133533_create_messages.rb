class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :game, null: false, foreign_key: true
      t.string :word_id
      t.string :content

      t.timestamps
    end
  end
end
