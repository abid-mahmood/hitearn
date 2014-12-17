class ChangeDatatypeOfRateColumn < ActiveRecord::Migration
  def change
    change_column :advertisements, :rate_per_click, :float
  end
end
