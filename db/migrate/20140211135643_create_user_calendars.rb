class CreateUserCalendars < ActiveRecord::Migration
  def change
    create_table :user_calendars do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
