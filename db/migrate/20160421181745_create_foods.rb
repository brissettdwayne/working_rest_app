class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.references :order
      t.references :table
      t.timestamps null: false
    end
  end
end
