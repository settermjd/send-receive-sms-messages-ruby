require 'dotenv'
require 'twilio-ruby'

Dotenv.load

account_sid = ENV.fetch('TWILIO_ACCOUNT_SID', nil)
auth_token = ENV.fetch('TWILIO_AUTH_TOKEN', nil)
recipient = ENV.fetch('RECIPIENT', nil)
sender = ENV.fetch('TWILIO_PHONE_NUMBER', nil)

@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.api.v2010.messages.create(
  body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
  to: recipient,
  from: sender
)

puts message.sid
