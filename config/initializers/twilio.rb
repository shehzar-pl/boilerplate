Twilio.configure do |config|
    config.account_sid = "AC88e66f706c303f6a261df343d388e042"
    config.auth_token = "1266de4de7379e5201bea21de0384ffa"
  end
  
TWILIO_CLIENT = Twilio::REST::Client.new