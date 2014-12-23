class ChangeColumnName < ActiveRecord::Migration
  def change
    remove_column :users, :earned_money
  end
end
