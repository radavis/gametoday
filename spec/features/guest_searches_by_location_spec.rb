require 'spec_helper'

feature 'user searches by location', %q{
  As a guest
  I want to enter my location
  So that I can see the games that are happening today.
} do

  scenario 'guest enters name of city and sees events' do
    SeatGeek::SeatGeekEventQuery.any_instance
      .stub(:fetch_results)
      .and_return([{
        "title" => "Baltimore Orioles at Boston Red Sox",
        "datetime_local" => "2013-09-18T19:10:00",
        "url" => "http://something/",
        "venue" => { "location" => "Fenway" }
      }])

    visit '/'  #root_path

    fill_in 'City', with: 'Boston'
    click_on 'Search Events'

    expect(page).to have_content('Baltimore Orioles at Boston Red Sox')
  end
end
