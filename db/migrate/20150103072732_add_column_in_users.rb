class AddColumnInUsers < ActiveRecord::Migration
  def change
    add_column :users, :free, :boolean, :default => false
  end
end
