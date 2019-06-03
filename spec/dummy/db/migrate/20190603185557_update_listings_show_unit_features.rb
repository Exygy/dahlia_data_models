class UpdateListingsShowUnitFeatures < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :show_unit_features, :hide_unit_features
    change_column :listings, :hide_unit_features, :boolean, default: false, null: false
  end
end
