class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :skill, foreign_key: true
      t.integer :milestone
      t.date :starting_date
      t.string :first_place
      t.string :last_place
      t.text :description

      t.timestamps
    end
  end
end
