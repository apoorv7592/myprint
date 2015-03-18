class CreateEntryAttachements < ActiveRecord::Migration
  def change
    create_table :entry_attachements do |t|
      t.integer :entry_id

      t.timestamps
    end
  end
end
