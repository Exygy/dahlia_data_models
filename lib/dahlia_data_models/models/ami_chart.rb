# Represents an Area Median Income chart
class AmiChart < ApplicationRecord
  enum chart_type: {
    hcd: 0,
    hud: 1,
    mtsp_hera_special: 2,
    mtsp_regular: 3,
  }

  has_many :units
  belongs_to :group

  validates :group_id, uniqueness: {
    scope: [:chart_type, :year],
    message: 'A group can only have one chart of a type per year.'
  }
end
