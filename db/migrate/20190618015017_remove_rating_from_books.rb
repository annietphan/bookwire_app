class RemoveRatingFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :rating, :integer
  end
end
