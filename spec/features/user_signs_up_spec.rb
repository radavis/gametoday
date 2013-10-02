require 'spec_helper'

feature 'user signs up', %q{

  As a sports fan,
  I want to be able to register an account,
  So that I do not have to reenter my location data every visit.

} do

  # Acceptance Criteria
  # * The website should accept and remember my email address and location.
  # * The website should send me to a confirmation page when the form is
  #   filled out correctly.
  # * The website should give me an error if the form is not filled out correctly.

  scenario 'specify valid and required information' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("Welcome, Sports Fan!")
    expect(page).to have_content("Sign out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign out")
  end

  scenario 'password and confirmation do not match' do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'somethingDifferent'
    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign out")
  end

end
