class RemoveColumnToEvents < ActiveRecord::Migration[6.1]
  def up
    remove_column :events, :start_on, :date
  end

  def down
    add_column :events, :start_on, :date
  end
end
