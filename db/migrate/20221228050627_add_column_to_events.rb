class AddColumnToEvents < ActiveRecord::Migration[6.1]
  def up
    add_column :events, :start_on, :date
  end

  def down
    remove_column :events, :start_on, :date
  end
end
