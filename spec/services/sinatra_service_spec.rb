require "rails_helper"

describe 'sinatra service' do
  it 'can get results' do
    WebMock.disable!
    updated_at = 3.days.ago
    interval = 432000
    user_id = 3
    data = {
      "updated_at": "#{updated_at}",
      "interval": "#{interval}",
      "user_id": "#{user_id}"
    }
    data = data.to_json
    service = SinatraService.new
    results = service.grab_data(data)
    expect(results).to be_a Hash
    expect(results).to have_key(:time_difference)
  end
end
