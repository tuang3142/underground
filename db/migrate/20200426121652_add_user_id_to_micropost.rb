class AddUserIdToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_index :microposts, %i[user_id created_at]
  end
end
