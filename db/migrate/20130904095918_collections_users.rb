class CollectionsUsers < ActiveRecord::Migration
  def change
    create_table :collections_users, :id => false do |t|
      t.integer :collection_id
      t.integer :user_id

      #add_index :collections_users, :collection_id
      #add_index :collections_users, :user_id
    end
  end
end
