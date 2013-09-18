class EventsController < ApplicationController

  def index
    if params[:city]

      @query = SeatGeek::SeatGeekEventQuery.new({
        city: params[:city],
        date: 'today',
        type: "sports"
      })
      @events = @query.results
    end
  end
end
