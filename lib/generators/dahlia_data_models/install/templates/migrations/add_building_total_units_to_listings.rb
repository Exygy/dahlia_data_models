class AddBuildingTotalUnitsToListings < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :listings, :building_total_units, :integer
  end
end
