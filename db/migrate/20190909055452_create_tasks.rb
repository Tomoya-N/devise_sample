class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.date :limit
      t.timestamps
    end
  end
end
