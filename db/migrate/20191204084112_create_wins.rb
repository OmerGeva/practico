class CreateWins < ActiveRecord::Migration[5.2]
  def change
    create_table :wins do |t|
      t.string :challenge
      t.string :user

      t.timestamps
    end
  end
end
