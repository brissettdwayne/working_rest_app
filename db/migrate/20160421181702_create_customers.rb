class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.references :table
      t.references :order
      t.timestamps null: false
    end
  end
end
