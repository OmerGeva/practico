class SendTwilioMessage
  def initialize(alert)
    @alert = alert
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_TOKEN']
    @service_number = "+14193181678" # From Twilio
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_message(friend)
    @client.messages.create(
      from: @service_number,
      to: to,
      body: message
    )
  end
end
