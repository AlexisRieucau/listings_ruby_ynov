class TableUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name,      null: false
      t.string  :password,  null: false
      t.string  :role
    end
  end
end
