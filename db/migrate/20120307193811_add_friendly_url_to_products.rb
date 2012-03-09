class AddFriendlyUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :friendly_url, :string
    add_index :products, :friendly_url

  end
end
