class AddStarToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :star, :boolean
  end
end
