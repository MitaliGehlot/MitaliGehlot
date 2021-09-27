class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :card_id
      t.float :total_cost
      t.integer :quantity

      t.timestamps
    end
  end
end
