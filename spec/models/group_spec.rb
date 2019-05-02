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

    expect(Group.for_domain('stage.herokuapp.com').id).to eq(g1.id)
    expect(Group.for_domain('domain.com').id).to eq(g2.id)
    expect(Group.for_domain('subdomain.herokuapp.com').id).to eq(g3.id)
  end

  it "will provide a slug for translations" do
    g = Group.create(name: 'Stage', slug: 'smc', domain: 'herokuapp.com')
    expect(Group.for_domain('subdomain.herokuapp.com').slug).to eq('smc')
  end
end
