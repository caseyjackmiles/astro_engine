require 'json'
require 'net/http'
require 'ostruct'

# Public: Contains classes related to the SunriseSunset API.
# See https://sunrise-sunset.org/api for more information about API
# and usage requirements.
module SunriseSunset
  ATTRIBUTION_LINK = 'https://sunrise-sunset.org/'
  BASE_URI = 'https://api.sunrise-sunset.org/json'
  RESPONSE_RESULTS = %i[
    sunrise sunset solar_noon day_length
    civil_twilight_begin civil_twilight_end
    nautical_twilight_begin nautical_twilight_end
    astronomical_twilight_begin astronomical_twilight_end
    attribution
  ]

  # Public: Class for unsuccessful REST API calls.
  APIError = Class.new(StandardError)

  # Public: Class for making SunriseSunset REST API calls.
  class Client
    # Public: Send a request to SunriseSunset API.
    #
    # latitude  - Float latitude in decimal degrees
    # longitude - Float longitude in decimal degrees
    # date      - Optional String YYYY-MM-DD format (default: today)
    # formatted - Optional Integer to format using ISO-8601 (default: 1, do not format)
    #
    # Examples
    #
    #  SunriseSunset::Client.get_sunrise_sunset latitude: 36.720, longitude: -4.4203
    #  # => #<OpenStruct sunrise="6:05:57 AM", sunset="6:38:11 PM" ...>
    #
    # Returns OpenStruct instance if HTTP request was successful.
    #  See SunriseSunset::RESPONSE_RESULTS for field names.
    # Raises SunriseSunset::APIError if HTTP request was not successful.
    def self.get_sunrise_sunset(latitude:, longitude:, date: nil, formatted: nil)
      uri = URI(BASE_URI)
      params = { lat: latitude, lng: longitude, date: date, formatted: formatted }.compact
      uri.query = URI.encode_www_form(params)

      response = Net::HTTP.get_response(uri)
      raise APIError unless response.is_a? Net:HTTPSuccess

      response_body = JSON.parse response.body
      OpenStruct.new response_body['results'].merge(attribution: ATTRIBUTION_LINK)
    end
  end
end
