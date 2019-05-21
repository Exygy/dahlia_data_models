class AddGtmKeyToGroups < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :groups, :gtm_key, :string
  end
end
