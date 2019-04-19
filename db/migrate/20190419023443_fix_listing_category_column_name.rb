class FixListingCategoryColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :category, :category_id
  end
end