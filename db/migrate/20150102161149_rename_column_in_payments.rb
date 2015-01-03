class RenameColumnInPayments < ActiveRecord::Migration
  def change
    rename_column :payments, :email, :user_id
  end
end
