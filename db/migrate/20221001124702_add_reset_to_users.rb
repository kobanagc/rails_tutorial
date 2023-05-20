puts "\n☆★☆★☆\ndb/migrate/20221001124702_add_reset_to_users.rb\n☆★☆★☆\n\n"

class AddResetToUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20221001124702_add_reset_to_users.rb\nclass AddResetToUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20221001124702_add_reset_to_users.rb\nclass AddResetToUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_column :users, :reset_digest, :string
    add_column :users, :reset_sent_at, :datetime
  end
end