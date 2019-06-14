class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end
  end
end
