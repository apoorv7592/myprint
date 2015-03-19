class AddVariantToSuites < ActiveRecord::Migration
  def change
  add_column :suites, :variant, :string
  end
end
