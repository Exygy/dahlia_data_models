class AddBuildingTotalUnitsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :building_total_units, :integer
  end
end
