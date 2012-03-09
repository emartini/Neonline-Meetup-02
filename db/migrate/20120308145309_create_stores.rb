class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :legal_name
      t.string :rut
      t.text :description

      t.timestamps
    end
  end
end
