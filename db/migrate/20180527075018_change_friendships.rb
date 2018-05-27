class ChangeFriendships < ActiveRecord::Migration[5.2]
  def change
    drop_table :friendships
    create_table :friendships do |t|
      t.integer :friend_a
      t.integer :friend_b      
    end
  end
end
