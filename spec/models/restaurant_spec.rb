require 'spec_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name less than three characters' do
    restaurant = Restaurant.new(name: 'Na')

    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
