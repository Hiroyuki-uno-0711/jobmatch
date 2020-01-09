class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.integer :user_id
      t.integer :room_id
      t.text :content
      t.integer :send_id
      t.integer :receive_id
      t.timestamps
    end
  end
end
