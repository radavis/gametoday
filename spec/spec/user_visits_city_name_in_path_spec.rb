require 'spec_helper'

feature "Frontpage", %q{
  As a guest
  I want to enter my location
  So that I can see the games that are happening today.
} do

# Acceptance Criteria:
# * The app takes the city name from the url: http://gametoday.in/boston
# * The page shows a list of games, sorted by date and time

  scenario "user enters a valid city name" do
    pending
    visit '/boston'
    expect(page).to have_content("Boston")
  end

  scenario "user enters an invalid city name"
end
