puts "\n☆★☆★☆\ndb/migrate/20220914162338_add_index_to_users_email.rb\n☆★☆★☆\n\n"

class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220914162338_add_index_to_users_email.rb\nclass AddIndexToUsersEmail < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220914162338_add_index_to_users_email.rb\nclass AddIndexToUsersEmail < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_index :users, :email, unique: true
  end
end