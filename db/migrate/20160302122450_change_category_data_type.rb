class ChangeCategoryDataType < ActiveRecord::Migration
  def up
    change_column :accounts, :category, :string
  end

  def down
    change_column :accounts, :category, :text
  end
end
