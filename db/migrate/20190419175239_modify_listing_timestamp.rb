class ModifyListingTimestamp < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :created_at, :datetime
    add_timestamps :listings, null: true

    old_time = DateTime.new(2000,1,1)
    Listing.update_all(created_at: old_time, updated_at: old_time)

    change_column_null :listings, :created_at, false
    change_column_null :listings, :updated_at, false
  end
end