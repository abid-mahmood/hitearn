class RenameCashOutColumn < ActiveRecord::Migration
  def change
    rename_column :users, :cash_out_request, :cash_out_id
  end
end
