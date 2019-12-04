class AddScheduledToUsersChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :users_challenges, :scheduled, :boolean, default: false
  end
end
