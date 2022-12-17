class ChangeTasksToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_table :tasks, :events
  end
end
