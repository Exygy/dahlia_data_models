# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190603185558) do

  create_table "ami_charts", force: :cascade do |t|
    t.string "ami_values_file"
    t.string "chart_type"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.index ["chart_type", "year", "group_id"], name: "index_ami_charts_on_chart_type_and_year_and_group_id", unique: true
    t.index ["group_id"], name: "index_ami_charts_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "domain"
    t.integer "group_type"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gtm_key"
    t.index ["lft"], name: "index_groups_on_lft"
    t.index ["parent_id"], name: "index_groups_on_parent_id"
    t.index ["rgt"], name: "index_groups_on_rgt"
  end

  create_table "listings", force: :cascade do |t|
    t.boolean "accepting_applications_at_leasing_agent", default: false, null: false
    t.boolean "accepting_applications_by_po_box", default: false, null: false
    t.boolean "accepting_online_applications", default: false, null: false
    t.string "accessibility"
    t.string "amenities"
    t.datetime "application_due_date"
    t.string "application_organization"
    t.string "application_city"
    t.string "application_phone"
    t.string "application_postal_code"
    t.string "application_state"
    t.string "application_street_address"
    t.boolean "blank_paper_application_can_be_picked_up", default: false, null: false
    t.string "building_city"
    t.string "building_name"
    t.text "building_selection_criteria"
    t.string "building_state"
    t.string "building_street_address"
    t.string "building_zip_code"
    t.text "costs_not_included"
    t.text "credit_history"
    t.decimal "deposit_max", precision: 8, scale: 2
    t.decimal "deposit_min", precision: 8, scale: 2
    t.string "developer"
    t.string "image_url"
    t.text "program_rules"
    t.string "external_id"
    t.integer "waitlist_max_size"
    t.string "name"
    t.string "neighborhood"
    t.integer "waitlist_current_size"
    t.text "pet_policy"
    t.string "priorities_descriptor"
    t.text "required_documents"
    t.integer "reserved_community_maximum_age"
    t.integer "reserved_community_minimum_age"
    t.string "reserved_descriptor"
    t.text "smoking_policy"
    t.integer "year_built"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.boolean "hide_unit_features", default: false, null: false
    t.text "unit_amenities"
    t.string "application_download_url"
    t.decimal "application_fee", precision: 5, scale: 2
    t.text "criminal_background"
    t.string "leasing_agent_city"
    t.string "leasing_agent_email"
    t.string "leasing_agent_name"
    t.string "leasing_agent_office_hours"
    t.string "leasing_agent_phone"
    t.string "leasing_agent_state"
    t.string "leasing_agent_street"
    t.string "leasing_agent_title"
    t.string "leasing_agent_zip"
    t.text "rental_history"
    t.index ["group_id"], name: "index_listings_on_group_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "available_units_count"
    t.integer "available_units_percent"
    t.text "description"
    t.string "name"
    t.integer "order"
    t.string "pdf_url"
    t.text "preference_proof_requirement_description"
    t.string "read_more_url"
    t.boolean "requires_proof", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "listing_id"
    t.index ["listing_id"], name: "index_preferences_on_listing_id"
  end

  create_table "units", force: :cascade do |t|
    t.decimal "ami_percentage", precision: 5, scale: 2
    t.decimal "annual_income_min", precision: 8, scale: 2
    t.decimal "monthly_income_min", precision: 8, scale: 2
    t.integer "floor"
    t.decimal "annual_income_max", precision: 8, scale: 2
    t.integer "max_occupancy"
    t.integer "min_occupancy"
    t.decimal "monthly_rent", precision: 8, scale: 2
    t.integer "num_bathrooms"
    t.integer "num_bedrooms"
    t.string "number"
    t.integer "priority_type"
    t.integer "reserved_type"
    t.integer "sq_ft"
    t.integer "status"
    t.integer "unit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "listing_id"
    t.integer "ami_chart_id"
    t.integer "monthly_rent_as_percent_of_income"
    t.index ["ami_chart_id"], name: "index_units_on_ami_chart_id"
    t.index ["listing_id"], name: "index_units_on_listing_id"
  end

end
