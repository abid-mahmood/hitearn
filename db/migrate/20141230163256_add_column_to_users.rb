class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_num, :integer 
  end
end
