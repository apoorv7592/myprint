class CreateLeafs < ActiveRecord::Migration
  def change
    create_table :leafs do |t|
      t.text :venue
      t.date :date_of_event
      t.time :time_of_event

      t.timestamps
    end
  end
end
