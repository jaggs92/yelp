require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: "Nando's" }

  scenario 'allows users to leave a review using a form' do
    visit 
  end
end
