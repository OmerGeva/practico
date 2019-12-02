class AddAcceptedToUsersChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :users_challenges, :accepted, :boolean
  end
end
