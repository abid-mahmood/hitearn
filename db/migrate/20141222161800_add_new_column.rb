class AddNewColumn < ActiveRecord::Migration
  def change
    add_column :users, :contact_number, :string
  end
end
