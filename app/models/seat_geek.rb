require 'rest-client'
require 'json'
require 'net/http'

module SeatGeek
  class SeatGeekEventQuery
    BASE_URL = "http://api.seatgeek.com/2/events?"

    attr_reader :attributes, :results, :query

    def initialize(attributes)
      @attributes = attributes
      @query = "#{BASE_URL}"
      build_query
      @results = fetch_results
    end

    def build_query
      #binding.pry
      @attributes.each do |k, v|
        if k[/distance/] and v.is_a?(Fixnum)
          @query << "range=#{v}mi"  # assume miles

        elsif k[/city/]
          @query << "venue.city=#{v.gsub(' ', '+').downcase}"

        elsif k[/date/]
          date = v
          date = Time.now.to_date.to_s if v[/today/]
          date = (Time.now + (60*60*24)).to_date.to_s if v[/tomorrow/]
          @query << "datetime_local=#{date}"

        elsif k[/type/]
          @query << "taxonomies.name=#{v}"

        elsif k[/ip/]  # matches zip and ip
          @query << "geoip=#{v}"

        else
          @query << "#{k}=#{v}"
        end
        @query << "&"
      end
      @query = @query[0...-1]  # remove last '&'
    end

    def fetch_results
      JSON.parse(RestClient.get(URI.encode(@query)))['events']
    end
  end
end

#URI class
