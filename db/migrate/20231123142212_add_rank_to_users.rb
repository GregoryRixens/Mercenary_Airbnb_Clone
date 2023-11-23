class AddRankToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rank, :string
  end
end
