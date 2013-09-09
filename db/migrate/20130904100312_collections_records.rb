class CollectionsRecords < ActiveRecord::Migration
  def change
    create_table :collections_records, :id => false do |t|
      t.integer :collection_id
      t.integer :record_id

      #add_index :collections_records, :collection_id
      #add_index :collections_records, :record_id
    end
  end
end

