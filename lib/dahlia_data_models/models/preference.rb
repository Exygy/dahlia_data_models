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
    { custom_api: 'unitsAvailable', domain: 'available_units_count', salesforce: 'Available_Units' },
    { custom_api: 'unitsAvailablePercent', domain: 'available_units_percent', salesforce: 'available_units_percent' },
    { custom_api: 'description', domain: 'description', salesforce: 'description' },
    { custom_api: 'name', domain: 'name', salesforce: 'Name' },
    { custom_api: 'order', domain: 'order', salesforce: 'Order' },
    { custom_api: 'pdfUrl', domain: 'pdf_url', salesforce: 'PDF_URL' },
    { custom_api: 'preferenceProofRequirementDescription', domain: 'preference_proof_requirement_description', salesforce: 'Preference_Proof_Requirement_Description' },
    { custom_api: 'readMoreUrl', domain: 'read_more_url', salesforce: 'Read_More_URL' },
    { custom_api: 'requiresProof', domain: 'requires_proof', salesforce: 'Requires_Proof' },
  ].freeze
end

# rubocop:enable Metrics/LineLength
