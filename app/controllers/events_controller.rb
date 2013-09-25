class EventsController < ApplicationController
  def index
    # grab city name from url and persist this in the session
    # allows for gametoday.in/boston

    #params[:city]   # user searches events (presedence)
    #params[:path]   # user types gametoday.in/boston
    #session[:city]  # we set the city

    @city = event_params[:city] # validate against a known list of cities
    #@city = params[:path]
    #@city ||= session[:city]
    #binding.pry

    if @city
      #session[:city] = @city
      @query = SeatGeek::SeatGeekEventQuery.new({
        city: @city,
        date: 'today',
        type: "sports"
      })
      @events = @query.results
    end
  end


  protected
  def event_params
    params.permit(:city)
  end
end
