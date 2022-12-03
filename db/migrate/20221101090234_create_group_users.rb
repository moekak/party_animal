class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|

      t.timestamps
      t.integer :user_id
      t.integer :post_id
    end
  end
end
