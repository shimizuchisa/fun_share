class RenameFromTaskIdColumnToEventIdColumnOnCharges < ActiveRecord::Migration[6.1]
  def change
    rename_column :charges, :task_id, :event_id
  end
end
