class AddRevealedToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :revealed, :boolean
  end
end
