class SetDefaultOnPreferencesRequiresProof < ActiveRecord::Migration<%= migration_version %>
  def change
    change_column :preferences, :requires_proof, :boolean, default: false, null: false
  end
end
