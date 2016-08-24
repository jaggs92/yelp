def sign_up
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in 'Email', with: 'email@gmail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end
