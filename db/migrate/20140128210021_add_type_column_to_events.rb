class AddTypeColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :type, :int
  end
end
