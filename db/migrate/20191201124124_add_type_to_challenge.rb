class AddTypeToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :time_type, :string
    add_column :challenges, :count_type, :string
  end
end
