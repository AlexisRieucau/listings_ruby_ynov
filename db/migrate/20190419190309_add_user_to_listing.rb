class AddUserToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :user_id, :integer, null: true

    Listing.update_all(user_id: 1)

    change_column_null :listings, :user_id,  false

    change_column_null :users, :email,  false
    change_column_null :users, :last_name,  false
  end
end
