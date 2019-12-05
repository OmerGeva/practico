class ChangeWinsColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :wins, :user
    remove_column :wins, :challenge

    add_reference :wins, :user, index: true
    add_reference :wins, :challenge, index: true

  end
end
