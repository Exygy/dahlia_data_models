# Represents a unit that belongs to a listing
class Unit < ApplicationRecord
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
end