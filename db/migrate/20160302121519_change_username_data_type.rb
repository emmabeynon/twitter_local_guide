class ChangeUsernameDataType < ActiveRecord::Migration
  def up
    change_column :accounts, :username, :string
  end

  def down
    change_column :accounts, :username, :text
  end
end
