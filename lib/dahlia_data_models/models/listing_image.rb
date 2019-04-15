# frozen_string_literal: true

# TODO: Re-enable Rubocop's line length check on this file once
# we have settled on a format for the field mapping items
# rubocop:disable Metrics/LineLength

# Represent a listing image object. Provide mapping between Salesforce
# object field names, Salesforce custom API field names, and domain
# field names for listing images.
class ListingImage < ActiveRecord::Base
  include ObjectBase

  FIELD_NAME_MAPPINGS = [
    { custom_api: 'image_url', domain: 'image_url', salesforce: 'image_url' }
  ]
end
