class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string   :address
      t.integer  :phone_no
      t.float    :amount
      t.string   :payment_type
      t.references :user, index: true
      t.references :product, index: true
      t.timestamps
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :products

  end
end
