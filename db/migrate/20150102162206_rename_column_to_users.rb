class RenameColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :user_email, :email
  end
end
