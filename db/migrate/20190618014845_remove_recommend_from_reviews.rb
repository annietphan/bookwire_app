class RemoveRecommendFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :recommend, :boolean
  end
end
