require 'rails_helper'

RSpec.describe Group, type: :model do
  it "can contain other groups" do
    g1 = Group.create(name: 'Parent Group')
    g2 = Group.create(name: 'Child Group', parent: g1)

    expect(Group.find(g2.id).parent.id).to eq(g1.id)
  end

  it "is of the proper group type" do
    g = Group.new
    expect(g.city?).to be(true)
    expect(g.county?).to be(false)

    g.group_type = :county

    expect(g.county?).to be(true)
    expect(g.city?).to be(false)

    expect(Group.county.count).to eq(0)
    g.save
    expect(Group.county.count).to eq(1)
  end

  it "can by found by domain" do
    g1 = Group.create(name: 'Stage', domain: 'herokuapp.com')
    g2 = Group.create(name: 'Production', domain: 'domain.com')
    g3 = Group.create(name: 'Subdomains', domain: 'subdomain.herokuapp.com')
    g4 = Group.create(name: 'Multiple domains',
                      domain: 'sg.herokuapp.com,multiple.com')

    expect(Group.for_domain('stage.herokuapp.com').id).to eq(g1.id)
    expect(Group.for_domain('domain.com').id).to eq(g2.id)
    expect(Group.for_domain('subdomain.herokuapp.com').id).to eq(g3.id)
    expect(Group.for_domain('multiple.com').id).to eq(g4.id)
    expect(Group.for_domain('sg.herokuapp.com').id).to eq(g4.id)
    expect(Group.for_domain('sg.multiple.com').id).to eq(g4.id)
  end

  it "will provide a slug for translations" do
    g = Group.create(name: 'Stage', slug: 'smc', domain: 'herokuapp.com')
    expect(Group.for_domain('subdomain.herokuapp.com').slug).to eq('smc')
  end

  it "owns multiple listings" do
    g1 = Group.create(name: 'Group 1')
    g2 = Group.create(name: 'Group 2')
    Listing.create(name: 'Listing 1', group: g1)
    Listing.create(name: 'Listing 2', group: g1)
    Listing.create(name: 'Listing 3', group: g2)
    expect(g1.listings.count).to eq(2)
    expect(g2.listings.count).to eq(1)
  end

  it "owns hierarchical listings" do
    g1 = Group.create(name: 'Parent Group')
    g2 = Group.create(name: 'Child Group', parent: g1)
    l1 = Listing.create(name: 'Parent Group - Listing 1', group: g1)
    l2 = Listing.create(name: 'Child Group - Listing 2', group: g2)
    listing_ids = Group.find(g1.id).listings_for_self_and_descendants.pluck(:id)
    expect(listing_ids).to eq([l1.id, l2.id])
  end
end
