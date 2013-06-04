class AddTotalVotersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :totalvoters, :integer
  end
end
