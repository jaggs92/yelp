require 'rails_helper'
require 'web_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'displays restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating restaurants' do
    scenario 'should be able to add a restaurant' do
      sign_up
      visit '/restaurants'
      click_link "Add a restaurant"
      fill_in "Name", with: "KFC"
      click_button "Create Restaurant"
      expect(current_path).to eq "/restaurants"
      expect(page).to have_content "KFC"
    end

    context 'an invalid restaurant' do
      it 'does not let you submit a name that is too short' do
        sign_up
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing restaurants' do
    let!(:kfc) { Restaurant.create(name: 'KFC')}

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    scenario 'lets users edit restaurants' do
      create_restaurant
      click_link "Edit Nando's"
      fill_in 'Name', with: "Nando's"
      fill_in 'Description', with: 'Extra cheeky!'
      click_button 'Update Restaurant'
      expect(page).to have_content "Nando's"
      expect(page).to have_content 'Extra cheeky!'
      expect(current_path).to eq '/restaurants'
    end

    scenario "can't edit restaurants that you didn't create" do
      create_restaurant
      click_link "Sign out"
      sign_up(email: "nope@email.com")
      visit 'restaurants'
      expect(page).not_to have_content("Edit Nando's")
    end
  end

  context 'deleting restaurants' do
    scenario 'removes a restaurant when a user clicks a link' do
     create_restaurant
     click_link "Delete Nando's"
     expect(page).not_to have_content "Nando's"
     expect(page).to have_content 'Restaurant deleted successfully'
   end

   scenario 'you can only delete restaurants you created' do
     create_restaurant
     click_link "Sign out"
     sign_up(email: "nope@email.com")
     visit '/restaurants'
     expect(page).not_to have_content("Delete Nando's")
   end
  end
end
