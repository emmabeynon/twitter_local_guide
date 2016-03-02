class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.text :username
      t.text :category

      t.timestamps null: false
    end
  end
end
