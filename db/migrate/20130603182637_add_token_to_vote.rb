class AddTokenToVote < ActiveRecord::Migration
  def change
    add_column :votes, :token, :string
  end
end
