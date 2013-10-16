class Event < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :datetime_local
  validates_presence_of :league
  validates_presence_of :city
  validates_presence_of :venue
  validates_presence_of :url

  def self.today_in(city_name)
    # TODO: date should be determined by user's timezone
    results = where(city: city_name).where("date(created_at) = ?", Date.today)
    return results if !results.empty?

    api_query = SeatGeek::SeatGeekEventQuery.new({
      city: city_name,
      date: "today",
      type: "sports"
    })
    logger.info("SeatGeek API Queried for city: #{city_name}")

    if api_query.results
      api_query.results.each do |event|
        create(
          title: event['title'],
          datetime_local: event['datetime_local'],
          league: event['type'],
          city: event['venue']['city'],
          venue: event['venue']['name'],
          url: event['url']
        )
      end
    end

    where(city: city_name).where("date(created_at) = ?", Date.today)
  end
end
