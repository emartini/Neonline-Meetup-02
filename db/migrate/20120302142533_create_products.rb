class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :cost
      t.integer :price
      t.integer :store_id
      t.integer :stock
      t.string :status

      t.timestamps
    end
    add_index :products, :store_id
  end
end
