require 'dotenv'
require 'twilio-ruby'

Dotenv.load

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
recipient = ENV['RECIPIENT']
sender = ENV['TWILIO_PHONE_NUMBER']

@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.api.v2010.messages.create(
    body: "This is the ship that made the Kessel Run in fourteen parsecs?",
    to: recipient,
    from: sender
)

puts message.sid
