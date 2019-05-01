require 'rails_helper'

RSpec.describe Group, type: :model do
  it "can contain other groups" do
    g1 = Group.create(name: 'Parent Group')
    g2 = Group.create(name: 'Child Group', parent: g1)

    expect(Group.find(g2.id).parent.id).to eq(g1.id)
  end
end
