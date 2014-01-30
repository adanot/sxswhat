class AddAgeColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :age, :int
  end
end
