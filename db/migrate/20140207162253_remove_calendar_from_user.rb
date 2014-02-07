class RemoveCalendarFromUser < ActiveRecord::Migration
  def change
 	remove_column :users, :calendar
  end
end
