require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: "Nando's" }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link "Review Nando's"
    fill_in 'Thoughts', with: "It's best cheeky chicken!"
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content "It's best cheeky chicken!"
  end
end
