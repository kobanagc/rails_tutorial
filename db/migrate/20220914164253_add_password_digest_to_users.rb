puts "\n☆★☆★☆\ndb/migrate/20220914164253_add_password_digest_to_users.rb\n☆★☆★☆\n\n"

class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220914164253_add_password_digest_to_users.rb\nclass AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220914164253_add_password_digest_to_users.rb\nclass AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_column :users, :password_digest, :string
  end
end