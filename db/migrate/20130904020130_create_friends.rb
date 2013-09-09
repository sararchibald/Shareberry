class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :org_user
      t.integer :rec_user
      t.integer :confirmed

      t.timestamps
    end
  end
end
