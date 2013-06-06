class AddTimeDescriptionToEventTime < ActiveRecord::Migration
  def change
    add_column :event_times, :time_description, :time
  end
end
