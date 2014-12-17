class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated_at, :datetime
    add_column :users, :activated, :boolean, default: false
    add_column :users, :earned_money, :integer
    add_column :users, :cash_out_request, :integer
  end
end
