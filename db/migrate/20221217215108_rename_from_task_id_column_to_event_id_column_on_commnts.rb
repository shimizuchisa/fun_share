class RenameFromTaskIdColumnToEventIdColumnOnCommnts < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :task_id, :event_id
  end
end
