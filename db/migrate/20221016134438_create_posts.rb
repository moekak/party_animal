class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :genre_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :place
      t.string :address
      t.integer :price
      t.string :belongings
      t.string :participants_list
      t.date :date
      t.time :time

    end
  end
end
