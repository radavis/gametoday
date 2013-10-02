require 'spec_helper'

feature 'user signs in', %q{

  As a registered game_today? sports fan,
  I want to log in,
  So that I can see what games are happening today.

} do

  # Acceptance Criteria:
  # * Their location should be remembered from their previous login.
  # * The user should be able to see a list of games in their city,
  #   sorted by date and time.
  # * Incorrect login data should give the user an error.

  scenario 'user signs in with valid credentials' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    click_on 'Sign out'

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Sign in'

    expect(page).to have_content('Welcome Back, Sports Fan!')
    expect(current_path).to eql(root_path)
  end

  scenario 'user signs in with invalid credentials' do
    visit root_path
    click_on 'Sign in'
    click_button 'Sign in'
    expect(page).to have_content('Invalid email or password')
    expect(current_path).to eql(new_user_session_path)
  end
end
