class CreateDahliaPreferences < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :preferences do |t|
      t.integer :available_units_count
      t.integer :available_units_percent
      t.text :description
      t.string :name
      t.integer :order
      t.string :pdf_url
      t.text :preference_proof_requirement_description
      t.string :read_more_url
      t.boolean :requires_proof

      t.timestamps
    end

    add_reference :preferences, :listing, foreign_key: true
  end
end
