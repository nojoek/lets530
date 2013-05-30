class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.time :time1
      t.time :time2
      t.time :time3
      t.time :time4
      t.integer :event_id

      t.timestamps
    end
  end
end
