class AddRankToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :rank, :string
  end
end
