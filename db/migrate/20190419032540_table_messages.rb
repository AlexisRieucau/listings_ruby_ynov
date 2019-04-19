class TableMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text      :content
      t.integer   :listing_id,  null: false
      t.integer   :user_ach_id, null: false
      t.integer   :user_ven_id, null: false
    end
  end
end
