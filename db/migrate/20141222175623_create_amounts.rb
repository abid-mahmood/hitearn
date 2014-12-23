class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.float :fixed_amount
      t.timestamps
    end
  end
end
