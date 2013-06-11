class AddEventLocationColumnToVote < ActiveRecord::Migration
  def change
    add_column :votes, :event_location_column, :string
  end
end
