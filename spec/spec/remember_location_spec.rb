require 'spec_helper'

feature "Remember location", %q{
  As a returning gametoday user,
  I want the website to remember my city,
  So that I can see what games are happening today
} do

# Acceptance Criteria:
# * Their location should be remembered from their previous visit
# * The user should be able to see a list of games in their city

  scenario "user returns" do
    pending
    visit '/Austin'
    visit '/'
    expect(page).to have_content('Austin')
  end

end
