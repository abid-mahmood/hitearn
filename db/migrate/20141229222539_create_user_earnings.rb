class CreateUserEarnings < ActiveRecord::Migration
  def change
    create_table :user_earnings do |t|
      t.integer :user_id
      t.integer :adv_id
      t.float :rate
      t.timestamps
    end
  end
end
