class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :city
      t.string :gender
      t.string :product_id
      t.string :url

      t.timestamps
    end
  end
end
