class DropClubs < ActiveRecord::Migration[5.2]
  def change
    drop_table :clubs
  end
end
