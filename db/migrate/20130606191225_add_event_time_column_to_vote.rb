class AddEventTimeColumnToVote < ActiveRecord::Migration
  def change
    add_column :votes, :event_time_column, :string
  end
end
