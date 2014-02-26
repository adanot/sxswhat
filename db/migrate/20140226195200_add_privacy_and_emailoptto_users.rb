class AddPrivacyAndEmailopttoUsers < ActiveRecord::Migration
  def change
	add_column :users, :privacy, :boolean
	add_column :users, :emailopt, :boolean
  end
end
