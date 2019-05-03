require 'rails_helper'

RSpec.describe Unit, type: :model do
  it "can be saved" do
    listing = Listing.create(name: 'Listing 1')
    unit = Unit.new(listing: listing)
    expect(unit.save).to be(true)
  end

  it "has working enums" do
    unit = Unit.new
    unit.unit_type = :one_bdrm
    unit.reserved_type = 0
    unit.status = 'available'

    expect(unit.priority_type).to be(nil)
    expect(unit.unit_type).to eq('one_bdrm')
    expect(unit.reserved_type).to eq('senior')
    expect(unit.status).to eq('available')
    expect(unit.available?).to be(true)
    expect(unit.one_bdrm?).to be(true)
    expect(unit.two_bdrm?).to be(false)
  end

  it "has correct decimal fields" do
    listing = Listing.create(name: 'Listing 1')
    unit = Unit.create(listing: listing, bmr_annual_income_min: 30500.50, monthly_rent: "123.45")

    expect(Unit.find(unit.id).bmr_annual_income_min).to eq(30500.50)
    expect(Unit.find(unit.id).monthly_rent).to eq(123.45)
  end
end