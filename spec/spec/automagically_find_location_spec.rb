require 'spec_helper'

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
