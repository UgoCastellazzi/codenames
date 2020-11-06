class RemoveNumberClueFromClues < ActiveRecord::Migration[6.0]
  def change
    remove_column :clues, :number_clue
  end
end
