class AddColumnFreeToEvents < ActiveRecord::Migration
  def change
	add_column :events, :free, :boolean
	add_column :events, :rsvp, :boolean
  end
end
