class CreateJobInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :job_informations do |t|

      t.string :title, null: false
      t.string :summary, null: false
      t.string :company, null: false
      t.integer :user_id, null: false
      t.integer :genre, null: false
      t.integer :area, null: false
      t.integer :income, null: false
      t.text :detail
      t.text :job_image_id
      t.timestamps
    end
  end
end
