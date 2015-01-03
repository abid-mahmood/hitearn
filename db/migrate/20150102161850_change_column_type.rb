class ChangeColumnType < ActiveRecord::Migration
  def change
    remove_column :payments, :user_id
  end
end
