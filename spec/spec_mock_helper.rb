require 'webmock/rspec'

include WebMock::API

def stub_api_request method, path , fixture = nil
  uri = FlightStats::API.base_uri.to_s + path
  response = if block_given?
    yield
  else
    File.read File.expand_path("../fixtures/#{fixture}.json", __FILE__)
  end
  stub_request(method, /^#{uri.to_s}.*/)
  .with(:headers => {"User-Agent" => /^FlightStats\/.+/, "Accept" => "application/json"})
  .to_return(:status => 200, :body => response, :headers => {
                                                               "server" => ["nginx/1.1.19"],
                                                               "date" => ["Sat, 06 Apr 2013 05:06:23 GMT"],
                                                               "content-type" => ["application/json;charset=UTF-8"],
                                                               "content-length" => ["708"],
                                                               "connection" => ["keep-alive"],
                                                               "vary"=>["Accept-Encoding"]
                                                            })
end

def data_from_response fixture
    response = File.read(File.expand_path("../fixtures/#{fixture}.json", __FILE__))
    JSON.parse(response, symbolize_names: true)
end
