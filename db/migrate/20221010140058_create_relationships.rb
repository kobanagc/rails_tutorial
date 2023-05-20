puts "\n☆★☆★☆\ndb/migrate/20221010140058_create_relationships.rb\n☆★☆★☆\n\n"

class CreateRelationships < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20221010140058_create_relationships.rb\nclass CreateRelationships < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20221010140058_create_relationships.rb\nclass CreateRelationships < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end