require 'awesome_nested_set'

# Represents a group that owns listings - e.g. a county, a city
class Group < ApplicationRecord
  acts_as_nested_set

  enum group_type: [:city, :county]
  after_initialize :set_default_type, :if => :new_record?

  has_many :users # relevant only for Admin site
  has_many :listings

  def set_default_type
    self.group_type ||= :city
  end

  def listings_for_self_and_descendants
    Listing.where(group_id: self_and_descendants.pluck(:id))
  end

  def self.for_domain(domain)
    if group = Group.find_by(domain: domain)
      # return an exact match
      group
    else
      # try a wider search
      # (aka foo.bar.com will match group with bar.com domain)
      groups = self.pluck(:id, :domain)
      group = groups.find { |item| domain.include? item[1] }
      if group
        Group.find(group[0])
      else
        raise 'No group could be found for domain'
      end
    end
  end
end