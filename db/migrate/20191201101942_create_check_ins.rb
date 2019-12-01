class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.references :users_challenge, foreign_key: true
      t.boolean :completed
      t.float :duration

      t.timestamps
    end
  end
end
