class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :adv_name
      t.integer :rate_per_click
      t.string :company
      t.timestamps
    end
  end
end
