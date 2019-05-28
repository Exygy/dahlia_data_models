# frozen_string_literal: true

# TODO: Re-enable Rubocop's line length check on this file once
# we have settled on a format for the field mapping items
# rubocop:disable Metrics/LineLength

# Represent a preference object. Provide mapping between Salesforce
# object field names, Salesforce custom API field names, and
# domain field names for preferences.
class Preference < ApplicationRecord
  include ObjectBase

  belongs_to :listing

  # TODO: Once we add more models and more fields, consider moving the
  # field mappings into YML files or other places.
  FIELD_NAME_MAPPINGS = [
    { custom_api: 'address', domain: 'street', salesforce: 'Street' },
    { custom_api: 'appMemberID', domain: 'application_member_id', salesforce: 'Application_Member' },
    { custom_api: 'description', domain: 'description', salesforce: 'description' },
    { custom_api: 'city', domain: 'city', salesforce: 'City' },
    { custom_api: 'individualPreference', domain: 'individual_preference', salesforce: 'Individual_preference' },
    { custom_api: 'listingPreferenceID', domain: 'listing_preference_id', salesforce: 'Listing_Preference_ID' },
    { custom_api: '', domain: 'lottery_status', salesforce: 'Lottery_Status' },
    { custom_api: 'lwPreferenceProof', domain: 'lw_type_of_proof', salesforce: 'LW_Type_of_Proof' },
    { custom_api: 'name', domain: 'name', salesforce: 'Name' },
    { custom_api: 'optOut', domain: 'opt_out', salesforce: 'Opt_Out' },
    { custom_api: 'order', domain: 'order', salesforce: 'Order' },
    { custom_api: 'pdfUrl', domain: 'pdf_url', salesforce: 'PDF_URL' },
    { custom_api: 'postLotteryValidation', domain: 'post_lottery_validation', salesforce: 'Post_Lottery_Validation' },
    { custom_api: '', domain: 'preference_lottery_rank', salesforce: 'Preference_Lottery_Rank' },
    { custom_api: 'preferenceName', domain: 'preference_name', salesforce: 'Preference_Name' },
    { custom_api: '', domain: 'preference_order', salesforce: 'Preference_Order' },
    { custom_api: 'preferenceProof', domain: 'type_of_proof', salesforce: 'Type_of_proof' },
    { custom_api: 'preferenceProofRequirementDescription', domain: 'preference_proof_requirement_description', salesforce: 'Preference_Proof_Requirement_Description' },
    { custom_api: '', domain: 'receives_preference', salesforce: 'Receives_Preference' },
    { custom_api: 'readMoreUrl', domain: 'read_more_url', salesforce: 'Read_More_URL' },
    { custom_api: 'requiresProof', domain: 'requires_proof', salesforce: 'Requires_Proof' },
    { custom_api: 'state', domain: 'state', salesforce: 'State' },
    { custom_api: '', domain: 'total_household_rent', salesforce: 'Total_Household_Rent' },
    { custom_api: 'zip', domain: 'zip_code', salesforce: 'Zip_Code' },
  ].freeze

  def self.from_salesforce(attributes)
    preference = super

    # Special field conversion cases for preferences
    if attributes.RecordType
      preference.fields.salesforce['RecordType.DeveloperName'] = attributes.RecordType.DeveloperName
      preference.fields.salesforce.delete 'RecordType'
    end

    preference.fields.salesforce['Application_Member'] = attributes.Application_Member.Id if attributes.Application_Member

    preference
  end

  def to_domain
    domain_fields = super

    # Special field conversion cases for preferences
    domain_fields.total_household_rent = domain_fields.total_household_rent.to_s if domain_fields.total_household_rent

    domain_fields
  end
end

# rubocop:enable Metrics/LineLength
