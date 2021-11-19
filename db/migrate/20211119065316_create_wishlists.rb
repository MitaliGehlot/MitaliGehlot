class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.float :price
      t.string :name
      t.text :model

      t.timestamps
    end
     add_foreign_key :wishlists, :users
    add_foreign_key :wishlists, :products
  end
end
