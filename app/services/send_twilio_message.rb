class SendTwilioMessage
  def initialize(alert)
    @alert = alert
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_TOKEN']
    @service_number = "+14193181678" # From Twilio
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_alert
    @alert.user.responders.each do |responder|
      next if responder.phone_number.blank?

      send_message(@alert.kind, responder.phone_number, responder.name)
    end
  end
end
