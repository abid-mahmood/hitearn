class CreateCashOuts < ActiveRecord::Migration
  def change
    create_table :cash_outs do |t|
      t.integer :user_id
      t.float :cash_out_amount
      t.timestamps
    end
  end
end
