class GoogleGeocode
  BASE_GOOGLE_URI = "https://maps.googleapis.com/maps/api/geocode/json"
  def geocode(address)
    url = BASE_GOOGLE_URI + "?address=#{ CGI.escape(address) }&sensor=false"
    response = HTTParty.get(url)
    if response.code == 200
      location = response.parsed_response["results"][0]["geometry"]["location"]
      {:latitude => location["lat"], :longitude => location["lng"] }
    else
      nil
    end
  end
end
