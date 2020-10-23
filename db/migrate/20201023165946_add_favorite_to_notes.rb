class AddFavoriteToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :favorite, :boolean
  end
end
