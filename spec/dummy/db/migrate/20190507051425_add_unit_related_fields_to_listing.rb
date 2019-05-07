class AddUnitRelatedFieldsToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :show_unit_features, :boolean
    add_column :listings, :unit_amenities, :text
  end
end
