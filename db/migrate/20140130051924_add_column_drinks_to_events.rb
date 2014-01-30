class AddColumnDrinksToEvents < ActiveRecord::Migration
  def change
    add_column :events, :drinks, :boolean
  end
end
