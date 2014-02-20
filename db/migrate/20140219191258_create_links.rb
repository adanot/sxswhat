class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url
      t.integer :event_id

      t.timestamps
    end
  end
end
