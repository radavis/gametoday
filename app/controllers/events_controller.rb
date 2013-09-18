class EventsController < ApplicationController

  def index
    @query = SeatGeek::SeatGeekEventQuery.new({ city: params[:path], date: 'today', type: "sports"})
    @events = @query.results
  end
end
