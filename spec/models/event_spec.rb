require 'spec_helper'

describe Event do
  it { should have_valid(:title).when('Bears at Dolphins') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:datetime_local).when('2013-10-16T19:00:00')}
  it { should_not have_valid(:datetime_local).when(nil, '') }

  it { should have_valid(:type).when('nfl', 'nba') }
  it { should_not have_valid(:type).when(nil, '') }

  it { should have_valid(:city).when('Boston'), ('Philadelphia') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:venue).when('Toyota Center') }
  it { should_not have_valid(:venue).when(nil, '') }

  it { should have_valid(:url).when("http://www.tickets.com") }
  it { should_not have_valid(:url).when(nil, '') }
end
