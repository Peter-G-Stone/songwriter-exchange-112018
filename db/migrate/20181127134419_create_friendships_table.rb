class CreateFriendshipsTable < ActiveRecord::Migration
  def change
    create_table :followed_users, id: false do |t|
      t.integer :user_id
      t.integer :friend_user_id
    end

    add_index(:followed_users, [:user_id, :friend_user_id], :unique => true)
    add_index(:followed_users, [:friend_user_id, :user_id], :unique => true)
 end
end
