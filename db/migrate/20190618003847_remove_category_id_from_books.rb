class RemoveCategoryIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :category_id, :integer
  end
end
