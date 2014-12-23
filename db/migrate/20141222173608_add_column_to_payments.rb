class AddColumnToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :fixed_amount, :float
  end
end
