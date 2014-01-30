class AddPriceColumnToEvents < ActiveRecord::Migration
  def change
	add_column :events, :price, :integer
  end
end
