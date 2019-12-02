class AddColorToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :color, :string
  end
end
