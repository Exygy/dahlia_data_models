require 'awesome_nested_set'

class Group < ApplicationRecord
  acts_as_nested_set

  has_many :users # relevant only for Admin site
  has_many :listings

  def listings_for_self_and_descendants
    Listing.where(group_id: self_and_descendants.pluck(:id))
  end
end