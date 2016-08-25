def sign_up (email: "example@email.com", password: "password", password_confirmation: "password")
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def create_restaurant
  sign_up
  click_link "Add a restaurant"
  fill_in "Name", with: "Nando's"
  click_button "Create Restaurant"
end
