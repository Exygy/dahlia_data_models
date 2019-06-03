class UpdateListingsFields < ActiveRecord::Migration<%= migration_version %>
  def change
    rename_column :listings, :credit_rating, :credit_history
    rename_column :listings, :legal_disclaimers, :program_rules
    rename_column :listings, :listing_id, :external_id
    rename_column :listings, :maximum_waitlist_size, :waitlist_max_size
    rename_column :listings, :number_of_people_currently_on_waitlist, :waitlist_current_size

    remove_column :listings, :building_url, :string
    remove_column :listings, :does_match, :boolean
    remove_column :listings, :first_come_first_served, :boolean
    remove_column :listings, :general_application_total, :integer
    remove_column :listings, :has_waitlist, :boolean, null: false, default: false
    remove_column :listings, :in_lottery, :boolean
    remove_column :listings, :last_modified_date, :datetime
    remove_column :listings, :lottery_city, :boolean, null: false, default: false
    remove_column :listings, :lottery_date, :datetime
    remove_column :listings, :lottery_results, :boolean, null: false, default: false
    remove_column :listings, :lottery_results_date, :datetime
    remove_column :listings, :lottery_results_url, :string
    remove_column :listings, :lottery_status, :string
    remove_column :listings, :lottery_street_address, :string
    remove_column :listings, :lottery_venue, :string
    remove_column :listings, :lottery_winners, :integer
    remove_column :listings, :marketing_url, :string
    remove_column :listings, :program_type, :string
    remove_column :listings, :project_id, :string
    remove_column :listings, :sase_required_for_lottery_ticket, :boolean, null: false, default: false
    remove_column :listings, :total_waitlist_openings, :integer
    remove_column :listings, :units_available, :integer

    add_column :listings, :application_fee, :decimal, precision: 5, scale: 2
    add_column :listings, :criminal_background, :text
    add_column :listings, :leasing_agent_city, :string
    add_column :listings, :leasing_agent_email, :string
    add_column :listings, :leasing_agent_name, :string
    add_column :listings, :leasing_agent_office_hours, :string
    add_column :listings, :leasing_agent_phone, :string
    add_column :listings, :leasing_agent_state, :string
    add_column :listings, :leasing_agent_street, :string
    add_column :listings, :leasing_agent_title, :string
    add_column :listings, :leasing_agent_zip, :string
    add_column :listings, :rental_history, :text
  end
end
