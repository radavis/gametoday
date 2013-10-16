class EventsController < ApplicationController
  def index

    #params[:city]   # user searches events (presedence)
    #params[:path]   # user types gametoday.in/boston
    #session[:city]  # we set the city

    #@city = event_params[:city] # validate against a known list of cities
    #@city = params[:path]
    #@city ||= session[:city]

    if event_params[:city]
      @city = event_params[:city]
      session[:city] = event_params[:city]

    elsif session[:city]
      @city = session[:city]
    end

    if @city
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
