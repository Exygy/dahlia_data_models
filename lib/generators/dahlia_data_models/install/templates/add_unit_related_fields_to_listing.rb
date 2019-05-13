class AddUnitRelatedFieldsToListing < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :listings, :show_unit_features, :boolean
    add_column :listings, :unit_amenities, :text
  end
end
