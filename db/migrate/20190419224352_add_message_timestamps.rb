class AddMessageTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :messages, null: true

    old_time = DateTime.new(2000,1,1)
    Message.update_all(created_at: old_time, updated_at: old_time)

    change_column_null :messages, :created_at, false
    change_column_null :messages, :updated_at, false
  end
end
