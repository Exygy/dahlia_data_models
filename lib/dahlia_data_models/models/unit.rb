# Represents a unit that belongs to a listing
class Unit < ApplicationRecord
  include ObjectBase

  belongs_to :ami_chart, optional: true
  belongs_to :listing

  enum ami_chart_type: {
    alpha: 0,
    beta: 1,
    gamma: 2,
  }
  enum priority_type: {
    hearing_impairments: 0,
    mobility_impairments: 1,
    vision_impairments: 2,
    all_impairments: 3,
    hearing_vision_impairments: 4,
  }
  enum reserved_type: {
    senior: 0,
    veteran: 1,
    developmental_disabilities: 2,
  }
  enum status: {
    available: 0,
    occupied: 1,
  }
  enum unit_type: {
    sro: 0,
    room: 1,
    studio: 2,
    large_studio: 3,
    junior_one_bdrm: 4,
    one_bdrm: 5,
    two_bdrm: 6,
    three_bdrm: 7,
    four_bdrm: 8,
    five_bdrm: 9,
  }

  # TODO: Once we add more models and more fields, consider moving the
  # field mappings into YML files or other places.
  FIELD_NAME_MAPPINGS = [
    { custom_api: 'AMI_chart_type', domain: 'ami_chart_type', salesforce: 'AMI_chart_type' },
    { custom_api: 'AMI_chart_year', domain: 'ami_chart_year', salesforce: 'AMI_chart_year' },
    { custom_api: 'of_AMI_for_Pricing_Unit', domain: 'ami_percentage', salesforce: 'of_AMI_for_Pricing_Unit' },
    { custom_api: 'BMR_Minimum_Annual_Income_Needed', domain: 'bmr_annual_income_min', salesforce: 'BMR_Minimum_Annual_Income_Needed' },
    { custom_api: 'BMR_Rental_Minimum_Monthly_Income_Needed', domain: 'bmr_monthly_income_min', salesforce: 'BMR_Rental_Minimum_Monthly_Income_Needed' },
    { custom_api: 'Unit_Floor', domain: 'floor', salesforce: 'Unit_Floor' },
    { custom_api: 'Maximum_Household_Income_Allowed', domain: 'max_household_income', salesforce: 'Maximum_Household_Income_Allowed' },
    { custom_api: 'maxOccupancy', domain: 'max_occupancy', salesforce: 'Max_Occupancy' },
    { custom_api: 'minOccupancy', domain: 'min_occupancy', salesforce: 'Min_Occupancy' },
    { custom_api: 'BMR_Rent_Monthly', domain: 'monthly_rent', salesforce: 'BMR_Rent_Monthly' },
    { custom_api: 'Rent_percent_of_income', domain: 'monthly_rent_as_percent_of_income', salesforce: 'Rent_percent_of_income' },
    { custom_api: 'Number_of_Bathrooms', domain: 'num_bathrooms', salesforce: 'Number_of_Bathrooms' },
    { custom_api: 'Number_of_Bedrooms', domain: 'num_bedrooms', salesforce: 'Number_of_Bedrooms' },
    { custom_api: 'Unit_Number', domain: 'number', salesforce: 'Unit_Number' },
    { custom_api: 'Priority_Type', domain: 'priority_type', salesforce: 'Priority_Type' },
    { custom_api: 'Reserved_Type', domain: 'reserved_type', salesforce: 'Reserved_Type' },
    { custom_api: 'Unit_Square_Footage', domain: 'sq_ft', salesforce: 'Unit_Square_Footage' },
    { custom_api: 'Status', domain: 'status', salesforce: 'Status' },
    { custom_api: 'Unit_Type', domain: 'unit_type', salesforce: 'Unit_Type' },
  ].freeze
end
