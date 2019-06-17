class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.boolean :recommend
      t.integer :book_id
      t.integer :user_id
    end
  end
end
