puts "\n☆★☆★☆\ndb/migrate/20220929134348_add_activation_to_users.rb\n☆★☆★☆\n\n"

class AddActivationToUsers < ActiveRecord::Migration[6.0]
  puts "\n☆★☆★☆\ndb/migrate/20220929134348_add_activation_to_users.rb\nclass AddActivationToUsers < ActiveRecord::Migration[6.0]\n☆★☆★☆\n\n"

  def change
    puts "\n☆★☆★☆\ndb/migrate/20220929134348_add_activation_to_users.rb\nclass AddActivationToUsers < ActiveRecord::Migration[6.0]\nchange method\n☆★☆★☆\n\n"

    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :datetime
  end
end