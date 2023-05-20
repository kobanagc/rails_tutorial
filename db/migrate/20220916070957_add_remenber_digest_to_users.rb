puts "\n☆★☆★☆\ndb/migrate/20220916070957_add_remenber_digest_to_users.rb\n☆★☆★☆\n\n"

class AddRemenberDigestToUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220916070957_add_remenber_digest_to_users.rb\nclass AddRemenberDigestToUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220916070957_add_remenber_digest_to_users.rb\nclass AddRemenberDigestToUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_column :users, :remember_digest, :string
  end
end