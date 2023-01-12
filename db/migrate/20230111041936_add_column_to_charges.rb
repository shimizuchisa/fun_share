class AddColumnToCharges < ActiveRecord::Migration[6.1]
  def up
    add_column :charges, :event_start_time, :datetime
  end

  def down
    remove_column :charges, :event_start_time, :datetime
  end
end
