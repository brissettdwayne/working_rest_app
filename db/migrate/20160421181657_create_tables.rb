class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_num, null: false
      t.references :waiter
      t.timestamps null: false
    end
  end
end
