class RenameColumnEmail < ActiveRecord::Migration
  def change
    rename_column :users, :email, :user_email
  end
end
