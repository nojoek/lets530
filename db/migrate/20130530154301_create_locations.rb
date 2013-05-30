class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :loc1
      t.string :loc2
      t.string :loc3
      t.string :loc4
      t.integer :event_id

      t.timestamps
    end
  end
end
