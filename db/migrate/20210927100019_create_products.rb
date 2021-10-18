class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.float :price
      t.string :name
      t.text :model
      t.references :category, index: true
      t.timestamps
    end
    #add_foreign_key :products, :categories
  end
end
