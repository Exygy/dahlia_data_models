# frozen_string_literal: true

# TODO: Re-enable Rubocop's line length check on this file once
# we have settled on a format for the field mapping items
# rubocop:disable Metrics/LineLength

# Represent a listing object. Provide mapping between Salesforce
# object field names, Salesforce custom API field names, and
# domain field names for listings.
class Listing < ApplicationRecord
  include ObjectBase

  belongs_to :group, optional: true
  has_many :preferences
  has_many :units

  # TODO: Once we add more models and more fields, consider moving the
  # field mappings into YML files or other places.
  FIELD_NAME_MAPPINGS = [
    { custom_api: 'Accepting_applications_at_leasing_agent', domain: 'accepting_applications_at_leasing_agent', salesforce: 'Accepting_applications_at_leasing_agent' },
    { custom_api: 'Accepting_applications_by_PO_Box', domain: 'accepting_applications_by_po_box', salesforce: 'Accepting_applications_by_PO_Box' },
    { custom_api: 'Accepting_Online_Applications', domain: 'accepting_online_applications', salesforce: 'Accepting_Online_Applications' },
    { custom_api: 'Accessibility', domain: 'accessibility', salesforce: 'Accessibility' },
    { custom_api: 'Amenities', domain: 'amenities', salesforce: 'Amenities' },
    { custom_api: 'Application_City', domain: 'application_city', salesforce: 'Application_City' },
    { custom_api: 'Download_URL', domain: 'application_download_url', salesforce: 'Download_URL' },
    { custom_api: 'Application_Due_Date', domain: 'application_due_date', salesforce: 'Application_Due_Date' },
    { custom_api: 'Fee', domain: 'application_fee', salesforce: 'Fee' },
    { custom_api: 'Application_Organization', domain: 'application_organization', salesforce: 'Application_Organization' },
    { custom_api: 'Application_Phone', domain: 'application_phone', salesforce: 'Application_Phone' },
    { custom_api: 'Application_Postal_Code', domain: 'application_postal_code', salesforce: 'Application_Postal_Code' },
    { custom_api: 'Application_State', domain: 'application_state', salesforce: 'Application_State' },
    { custom_api: 'Application_Street_Address', domain: 'application_street_address', salesforce: 'Application_Street_Address' },
    { custom_api: 'Blank_paper_application_can_be_picked_up', domain: 'blank_paper_application_can_be_picked_up', salesforce: 'Blank_paper_application_can_be_picked_up' },
    { custom_api: 'Building_City', domain: 'building_city', salesforce: 'Building_City' },
    { custom_api: 'Building_Name', domain: 'building_name', salesforce: 'Building_Name' },
    { custom_api: 'Building_Selection_Criteria', domain: 'building_selection_criteria', salesforce: 'Building_Selection_Criteria' },
    { custom_api: 'Building_State', domain: 'building_state', salesforce: 'Building_State' },
    { custom_api: 'Building_Street_Address', domain: 'building_street_address', salesforce: 'Building_Street_Address' },
    { custom_api: 'Building_Zip_Code', domain: 'building_zip_code', salesforce: 'Building_Zip_Code' },
    { custom_api: 'Costs_Not_Included', domain: 'costs_not_included', salesforce: 'Costs_Not_Included' },
    { custom_api: 'Credit_Rating', domain: 'credit_history', salesforce: 'Credit_Rating' },
    { custom_api: 'Criminal_History', domain: 'criminal_background', salesforce: 'Criminal_History' },
    { custom_api: 'Deposit_Max', domain: 'deposit_max', salesforce: 'Deposit_Max' },
    { custom_api: 'Deposit_Min', domain: 'deposit_min', salesforce: 'Deposit_Min' },
    { custom_api: 'Developer', domain: 'developer', salesforce: 'Developer' },
    { custom_api: 'listingID', domain: 'external_id', salesforce: 'listingID' },
    { custom_api: 'Id', domain: 'id', salesforce: 'Id' },
    { custom_api: 'imageURL', domain: 'image_url', salesforce: 'imageURL' },
    { custom_api: 'Leasing_Agent_City', domain: 'leasing_agent_city', salesforce: 'Leasing_Agent_City' },
    { custom_api: 'Leasing_Agent_Email', domain: 'leasing_agent_email', salesforce: 'Leasing_Agent_Email' },
    { custom_api: 'Leasing_Agent_Name', domain: 'leasing_agent_name', salesforce: 'Leasing_Agent_Name' },
    { custom_api: 'Leasing_Agent_Office_Hours', domain: 'leasing_agent_office_hours', salesforce: 'Leasing_Agent_Office_Hours' },
    { custom_api: 'Leasing_Agent_Phone', domain: 'leasing_agent_phone', salesforce: 'Leasing_Agent_Phone' },
    { custom_api: 'Leasing_Agent_State', domain: 'leasing_agent_state', salesforce: 'Leasing_Agent_State' },
    { custom_api: 'Leasing_Agent_Street', domain: 'leasing_agent_street', salesforce: 'Leasing_Agent_Street' },
    { custom_api: 'Leasing_Agent_Title', domain: 'leasing_agent_title', salesforce: 'Leasing_Agent_Title' },
    { custom_api: 'Leasing_Agent_Zip', domain: 'leasing_agent_zip', salesforce: 'Leasing_Agent_Zip' },
    { custom_api: 'Legal_Disclaimers', domain: 'program_rules', salesforce: 'Legal_Disclaimers' },
    { custom_api: 'Maximum_waitlist_size', domain: 'waitlist_max_size', salesforce: 'Maximum_waitlist_size' },
    { custom_api: 'Name', domain: 'name', salesforce: 'Name' },
    { custom_api: 'Neighborhood', domain: 'neighborhood', salesforce: 'Neighborhood' },
    { custom_api: 'Number_of_people_currently_on_waitlist', domain: 'waitlist_current_size', salesforce: 'Number_of_people_currently_on_waitlist' },
    { custom_api: 'Pet_Policy', domain: 'pet_policy', salesforce: 'Pet_Policy' },
    { custom_api: 'prioritiesDescriptor', domain: 'priorities_descriptor', salesforce: 'prioritiesDescriptor' },
    { custom_api: 'Eviction_History', domain: 'rental_history', salesforce: 'Eviction_History' },
    { custom_api: 'Required_Documents', domain: 'required_documents', salesforce: 'Required_Documents' },
    { custom_api: 'Reserved_community_maximum_age', domain: 'reserved_community_maximum_age', salesforce: 'Reserved_community_maximum_age' },
    { custom_api: 'Reserved_community_minimum_age', domain: 'reserved_community_minimum_age', salesforce: 'Reserved_community_minimum_age' },
    { custom_api: 'reservedDescriptor', domain: 'reserved_descriptor', salesforce: 'reservedDescriptor' },
    { custom_api: 'showUnitFeatures', domain: 'show_unit_features', salesforce: 'showUnitFeatures' },
    { custom_api: 'Smoking_Policy', domain: 'smoking_policy', salesforce: 'Smoking_Policy' },
    { custom_api: 'Unit_Amenities', domain: 'unit_amenities', salesforce: 'Unit_Amenities' },
    { custom_api: 'Year_Built', domain: 'year_built', salesforce: 'Year_Built' },
  ].freeze
end

# rubocop:enable Metrics/LineLength
