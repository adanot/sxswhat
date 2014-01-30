class AddTstartAndTendToEvents < ActiveRecord::Migration
  def change
	add_column :events, :tstart, :time
	add_column :events, :tend, :time
  end
end
