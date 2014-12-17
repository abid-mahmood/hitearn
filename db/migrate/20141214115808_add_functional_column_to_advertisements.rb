class AddFunctionalColumnToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :functional, :boolean, default: false
  end
end
