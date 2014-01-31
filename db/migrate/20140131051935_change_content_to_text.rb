class ChangeContentToText < ActiveRecord::Migration
  def change
	change_column :events, :content, :text
  end
end
