class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.boolean :status, default: false
      t.datetime :paid_at
      t.timestamps
    end
  end
end
