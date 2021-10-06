class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      

      t.references :customer, index: true
      t.references :product, index: true
      t.timestamps
    end
    add_foreign_key :orders, :customers
    add_foreign_key :orders, :products

  end
end
