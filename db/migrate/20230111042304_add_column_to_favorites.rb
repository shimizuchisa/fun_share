class AddColumnToFavorites < ActiveRecord::Migration[6.1]
  def up
    add_column :favorites, :event_start_time, :datetime
  end

  def down
    remove_column :favorites, :event_start_time, :datetime
  end
end
