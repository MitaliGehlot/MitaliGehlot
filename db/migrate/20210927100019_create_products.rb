class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
   t.belongs_to :categories

      t.integer :p_id
      t.float :p_price
      t.string :p_name
      t.text :p_model
        t.belongs_to :categories, foreign_key: true


      t.timestamps
    end
    def change
    create_table :categories do |t|
      t.integer :category_id
      t.string :category_name

      t.timestamps
    end
  end
end
