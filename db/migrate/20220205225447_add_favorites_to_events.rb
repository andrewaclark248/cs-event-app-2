class AddFavoritesToEvents < ActiveRecord::Migration[7.0]
  def change
  	add_column :events, :favorite, :boolean
  end
end
