class CreateUsersChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :users_challenges do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.float :user_progress

      t.timestamps
    end
  end
end
