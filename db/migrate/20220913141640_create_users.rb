puts "\n☆★☆★☆\ndb/migrate/20220913141640_create_users.rb\n☆★☆★☆\n\n"

class CreateUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220913141640_create_users.rb\nclass CreateUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220913141640_create_users.rb\nclass CreateUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end