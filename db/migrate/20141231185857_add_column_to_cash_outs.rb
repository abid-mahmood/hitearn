class AddColumnToCashOuts < ActiveRecord::Migration
  def change
    add_column :cash_outs, :completed, :boolean, :default => false
  end
end
