require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create(name: 'KFC')}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: "Just the best"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content "Just the best"
  end
end
