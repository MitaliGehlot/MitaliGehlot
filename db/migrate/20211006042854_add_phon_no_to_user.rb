class AddPhonNoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phon_no, :string
  end
end
