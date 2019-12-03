class AddValidationTypeToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :validation_type, :string
  end
end
