class AddColumnCalendarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :calendar, :text
  end
end
