puts "\n☆★☆★☆\ndb/migrate/20220916171023_add_admin_to_users.rb\n☆★☆★☆\n\n"

class AddAdminToUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220916171023_add_admin_to_users.rb\nclass AddAdminToUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220916171023_add_admin_to_users.rb\nclass AddAdminToUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_column :users, :admin, :boolean, default: false
  end
end