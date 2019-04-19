class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
  end
end
