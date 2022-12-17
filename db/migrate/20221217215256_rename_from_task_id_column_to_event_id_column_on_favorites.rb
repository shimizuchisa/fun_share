class RenameFromTaskIdColumnToEventIdColumnOnFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :task_id, :event_id
  end
end
