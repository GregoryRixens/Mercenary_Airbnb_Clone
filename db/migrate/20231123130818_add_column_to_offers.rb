class AddColumnToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :job, :string
  end
end
