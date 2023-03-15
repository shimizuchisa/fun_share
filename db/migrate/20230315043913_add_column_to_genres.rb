class AddColumnToGenres < ActiveRecord::Migration[6.1]
  def up
    add_column :genres, :is_deleted, :boolean, default: false
  end

  def down
    remove_column :genres, :is_deleted, :boolean, default: false
  end
end
