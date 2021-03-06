# frozen_string_literal: true

# Base representation of a Salesforce object. Provide mapping between
# Salesforce object field names, Salesforce custom API field names,
# and LAP domain field names.
module ObjectBase
  FIELD_TYPES = %i[custom_api domain salesforce].freeze

  # TODO: In the long run, we will likely not want to have the fields
  # instance var directly accessible, but for now we need it to be
  # accessible so we can update it for special field mapping cases.
  # When we develop a more sophisticated field mapping system, we
  # can likely do away with this accessor.
  attr_accessor :fields

  def add_fields(fields, format)
    raise ArgumentError, 'Field format is required when fields are provided.' if fields && !format
    @fields = Hashie::Mash.new(FIELD_TYPES.map { |t| [t, Hashie::Mash.new] }.to_h)
    @fields[format] = fields
  end

  # Define the class methods from_custom_api, from_domain, and from_salesforce
  FIELD_TYPES.each do |field_type|
    define_singleton_method :"from_#{field_type}" do |attributes|
      new(attributes, field_type)
    end
  end

  # Define the instance methods to_custom_api, to_domain, and to_salesforce
  FIELD_TYPES.each do |field_type|
    define_method :"to_#{field_type}" do
      @fields ||= {}
      # If we already have the requested fields, return those
      return @fields[field_type] if @fields[field_type].present?

      # If we don't have any existing field values, return an empty hash
      existing_field_type = FIELD_TYPES.find { |type| @fields[type].present? }
      existing_fields = @fields[existing_field_type]
      return {} unless existing_fields

      # Translate the existing fields we have into a corresponding
      # set of the requested field type
      existing_fields.each do |name, value|
        field_map = self.class::FIELD_NAME_MAPPINGS.find { |f| f[existing_field_type] == name }
        if field_map
          field_name = field_map[field_type]
          @fields[field_type][field_name] = value if field_name.present?
        end
      end

      @fields[field_type]
    end
  end

  def object_fields
    []
  end

  def to_salesforce_from_db
    salesforce_fields = {}

    self.class::FIELD_NAME_MAPPINGS.each do |field_map|
      salesforce_field_name = field_map[:salesforce]
      # Add blank hashes for any fields that are objects
      if object_fields.any? { |f| f[:salesforce] == salesforce_field_name}
        salesforce_fields[salesforce_field_name] = {}
      else
        salesforce_fields[salesforce_field_name] = self.send(field_map[:domain])
      end
    end

    salesforce_fields
  end
end
