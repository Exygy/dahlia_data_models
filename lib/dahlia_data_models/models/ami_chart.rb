# Represents an Area Median Income chart
class AmiChart < ApplicationRecord
  has_many :units
  belongs_to :group

  validates :group_id, uniqueness: {
    scope: [:chart_type, :year],
    message: 'A group can only have one chart of a type per year.'
  }
end
