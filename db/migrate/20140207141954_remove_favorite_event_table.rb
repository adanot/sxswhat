class RemoveFavoriteEventTable < ActiveRecord::Migration
  def change
	drop_table :favorite_events
  end
end
