class AddDateToCheckIn < ActiveRecord::Migration[5.2]
  def change
    add_column :check_ins, :date, :date
  end
end
