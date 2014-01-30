class ChangeAgeFormatInEvents < ActiveRecord::Migration

	def self.up
		change_column :events, :age, :integer
	end

	def self.down
		change_column :events, :age, :int
	end

end
