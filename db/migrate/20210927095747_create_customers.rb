class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :f_name
      t.string :l_name
      t.string :phon_no

      t.text :address
      t.text :email_id
      t.text :password

      t.timestamps
    end
  end
end
