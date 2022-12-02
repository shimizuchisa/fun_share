class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, naull: false
      t.integer :is_finished, null: false, default: 1
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.timestamps
    end
  end
end