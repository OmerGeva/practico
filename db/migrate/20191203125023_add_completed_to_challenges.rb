class AddCompletedToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :completed, :boolean, default: false
  end
end
