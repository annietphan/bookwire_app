class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|

      t.timestamps
    end
  end
end
