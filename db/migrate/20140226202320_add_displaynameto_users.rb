class AddDisplaynametoUsers < ActiveRecord::Migration
  def change
	add_column :users, :displayname, :string
  end
end
