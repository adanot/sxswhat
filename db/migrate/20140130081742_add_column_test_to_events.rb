class AddColumnTestToEvents < ActiveRecord::Migration
  def change
    add_column :events, :test, :boolean
  end
end
