puts "\n☆★☆★☆\ndb/migrate/20221004135730_create_microposts.rb\n☆★☆★☆\n\n"

class CreateMicroposts < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20221004135730_create_microposts.rb\nclass CreateMicroposts < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20221004135730_create_microposts.rb\nclass CreateMicroposts < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end