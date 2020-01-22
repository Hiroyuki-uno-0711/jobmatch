class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.datetime :complete_date
      t.string :task_content

      t.timestamps
    end
  end
end
