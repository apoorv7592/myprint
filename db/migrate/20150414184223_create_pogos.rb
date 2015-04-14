class CreatePogos < ActiveRecord::Migration
  def change
    create_table :pogos do |t|
      t.timestamps
    end
    add_attachment :pogos, :avatar
  end
end
