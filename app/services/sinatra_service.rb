class SinatraService

  def conn
    Faraday.new('http://deadmanswitch.us-west-2.elasticbeanstalk.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def grab_data(data)
    response = conn.get do |request|
      request.url '/timer2.json'
      request.body = data
      request.headers["Content-Type"] = "application/json"
      request.headers["Content-Length"] = "16"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
