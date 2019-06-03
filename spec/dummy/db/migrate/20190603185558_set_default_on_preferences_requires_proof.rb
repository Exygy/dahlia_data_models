class SetDefaultOnPreferencesRequiresProof < ActiveRecord::Migration[5.1]
  def change
    change_column :preferences, :requires_proof, :boolean, default: false, null: false
  end
end
