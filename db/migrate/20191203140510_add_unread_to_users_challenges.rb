class AddUnreadToUsersChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :users_challenges, :unread, :boolean, default: false
  end
end
