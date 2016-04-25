class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.references :food
      t.timestamps null: false
    end
  end
end
