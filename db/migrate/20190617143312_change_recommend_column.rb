class ChangeRecommendColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :recommend, :boolean, :default => false
  end
end
