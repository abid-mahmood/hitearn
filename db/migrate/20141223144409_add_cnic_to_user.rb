class AddCnicToUser < ActiveRecord::Migration
  def change
    add_column :users, :cnic, :string
  end
end
