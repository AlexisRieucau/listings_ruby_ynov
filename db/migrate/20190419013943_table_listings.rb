class TableListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string    :title,         null: false
      t.integer   :category,      null: false
      t.text      :description,   null: false
      t.float     :price,         null: false
      t.datetime  :created_at,    null: false

      t.index [:title], unique: true
    end
  end
end
