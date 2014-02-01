class ChangeAgetoString < ActiveRecord::Migration
  def change
	change_column :events, :age, :string

  end
end
