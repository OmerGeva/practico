class AddDateToWins < ActiveRecord::Migration[5.2]
  def change
    add_column :wins, :date, :date
  end
end
