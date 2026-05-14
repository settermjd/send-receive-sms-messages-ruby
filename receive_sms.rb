require 'sinatra'
require 'twilio-ruby'

# This route handles requests not to send a response back to the sender of the SMS.
#
# The route's response will contain TwiML that provides no further instructions to Twilio.
# In addition the response's status code will be an HTTP 200 OK, and the response will have
# the Content-Type header set to "application/xml; charset=utf-8".
post '/receive/no-response' do
  twiml = Twilio::TwiML::MessagingResponse.new

  content_type 'text/xml'

  twiml.to_s
end

# This route handles requests to send a response back to the sender of the SMS.
#
# If the request's form data contains an element named "Body" with the value "never gonna",
# the route's response will contain TwiML that instructs Twilio to send a reply SMS to
# the sender of the original SMS with a line from Rick Astley's hit "Never Gonna Give You Up".
# Otherwise it sends the same, stock line from the same song.
#
# In addition the response's status code will be an HTTP 200 OK, and the response will have
# the Content-Type header set to "application/xml; charset=utf-8".
post '/receive/with-response' do
  body = params['Body'].downcase

  default_option = "I just wanna tell you how I'm feeling - Gotta make you understand"
  options = [
    'give you up',
    'let you down',
    'make you cry',
    'run around and desert you',
    'say goodbye',
    'tell a lie, and hurt you'
  ]

  twiml = Twilio::TwiML::MessagingResponse.new
  twiml.message do |message|
    if body == 'never gonna'
      index = rand(1..(options.length - 1))
      message.body(options[index])
    else
      message.body(default_option)
    end
  end

  content_type 'text/xml'

  twiml.to_s
end
