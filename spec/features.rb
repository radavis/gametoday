require 'spec_helper'

feature "Frontpage", %q{
  As a guest
  I want to enter my location
  So that I can see the games that are happening today.
} do

# Acceptance Criteria:
# * The app takes the city name from the url: http://gametoday.in/boston
# * The page shows a list of games, sorted by date and time

  end

  scenario "user does not enter a city"

end


feature "Automagically find location", %q{
  As a lazy sports fan
  I want the website to automatically determine my location
  So that I do not have to type in my city
} do

# Acceptance Criteria:
# * The website determines my location via IP address
# * The website determines my location via GPS
# * If the location cannot be determined,
#   the user is prompted to enter their location.

  scenario "user location is determined via IP address"

  scenario "user location is determined via GPS"

  scenario "user is prompted for their location"

end


feature "User registration", %q{
  As a sports fan,
  I want to be able to register an account,
  So that I do not have to re-enter my location data every visit
} do

# Acceptance Criteria:
# * The website should accept and remember my email address and location.
# * The website should send me to a confirmation page when the form
#   is filled out correctly.
# * The website should give me an error if the form is not filled out correctly

  scenario "user registers with correct information"

  scenario "user tries to register with bad email address"

  scenario "user doesn't enter an email address"

end


feature "Favorite Teams/Leagues", %q{
  As a registered gametoday user,
  I want to save my favorite teams,
  So that I can know when they are playing in the future.
} do

# Acceptance Criteria
# * A list of teams should be displayed for selection
# * A list of leagues should be displayed for selection
# * The website should remember my selections.

  scenario "user selects NFL league"

  scenario "user select Miami Dolphins"

end


feature "Login", %q{
  As a registered gametoday user,
  I want to log in,
  So that I can see what games are happening today
} do

# Acceptance Criteria:
# * Their location should be remembered from their previous login
# * The user should be able to see a list of games in their city
# * Incorrect login information will give an error.

  scenario "user logs in correctly"

  scenario "user logs in incorrectly"

end
