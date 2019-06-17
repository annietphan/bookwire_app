class RemoveClubIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :club_id
  end
end
