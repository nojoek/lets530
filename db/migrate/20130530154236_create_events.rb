class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :title
      t.string :final_destination
      t.time :final_time
      t.integer :user_id

      t.timestamps
    end
  end
end
