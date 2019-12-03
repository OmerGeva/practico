class AddPhotosToCheckIn < ActiveRecord::Migration[5.2]
  def change
   add_column :check_ins, :photo, :string
  end
end
