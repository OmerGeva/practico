class RemoveScheduledFromChallenges < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :scheduled
  end
end
