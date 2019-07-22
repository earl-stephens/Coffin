class TwilioTextMessenger

  attr_reader :message

  def initialize(message)
    @message = message
  end

  sid = ENV['TWILIO_ACCOUNT_SID']
  token = ENV['TWILIO_AUTH_TOKEN']

  def call
    client = Twilio::REST::Client.new(sid, token)
    client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: '+13038100629',
      body: @message
      })
  end
end
