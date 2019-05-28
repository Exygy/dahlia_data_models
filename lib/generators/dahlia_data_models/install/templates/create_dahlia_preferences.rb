class CreateDahliaPreferences < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :preferences do |t|
      t.text :description
      t.string :name
      t.integer :order
      t.string :pdf_url
      t.text :preference_proof_requirement_description
      t.string :read_more_url
      t.boolean :requires_proof
      t.string :type_of_proof
      t.integer :units_available

      t.timestamps
    end

    add_reference :preferences, :listing, foreign_key: true
  end
end
