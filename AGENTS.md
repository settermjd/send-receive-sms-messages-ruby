# Send & receive SMS messages with Ruby

Demonstrates how to send and receive SMS messages using the Twilio API with Ruby.

## Environment Variables

Copy `.env.example` to `.env`. Never commit `.env`.

```bash
cp .env.example .env
```

| Variable | Where to find | Format |
| -------- | ------------- | ------ |
| `TWILIO_ACCOUNT_SID` | Console homepage or Admin dropdown (top right) → Account Management → Keys & Credentials → API Keys & Tokens | Starts with `AC` |
| `TWILIO_AUTH_TOKEN` | Console homepage or Admin dropdown (top right) → Account Management → Keys & Credentials → API Keys & Tokens → click to reveal | 32-char string. Treat as a password. |
| `TWILIO_PHONE_NUMBER` | Console → Phone Numbers → Manage → Active Numbers | E.164 format: `+15551234567` |
| `RECIPIENT` | The destination phone number you want to send SMS to | E.164 format: `+15551234567` |

## Commands

```bash
# Install
gem install dotenv twilio-ruby sinatra

# Send an SMS
ruby send_sms.rb

# Receive SMS (starts Sinatra server on port 4567)
ruby receive_sms.rb

# Expose webhooks locally
# Requires ngrok — install and authenticate at https://ngrok.com before running
ngrok http 4567
# Set the resulting URL as the webhook in Twilio Console
```

## Project Structure

- `send_sms.rb` — sends a single SMS via the Twilio REST API
- `receive_sms.rb` — Sinatra server handling inbound SMS webhooks on two routes
- `.env.example` — template for required credentials

## Agent Boundaries

**Always:**
- Confirm `.env` is configured before running any command
- Use the Environment Variables section to guide the user to each credential — don't ask them to find values without direction
- Confirm the app is running before asking the user to test it

**Never:**
- Run the app with missing or placeholder credentials
- Hardcode credentials or phone numbers in source files
- Skip the `cp .env.example .env` step

## Verify It's Working

**Send:** Run `ruby send_sms.rb` — a message SID (starts with `SM`) printed to stdout confirms the SMS was sent. Check that `RECIPIENT` received it.

**Receive:** Start `ruby receive_sms.rb`, expose it with ngrok, and set the ngrok URL + `/receive/with-response` as the webhook for `TWILIO_PHONE_NUMBER` in Twilio Console. Text that number — you should receive a reply.

## Twilio Resources

- [Twilio Console](https://console.twilio.com) — credentials, phone numbers, webhook configuration
- [Twilio SMS docs](https://www.twilio.com/docs/sms)
- [twilio-ruby SDK](https://www.twilio.com/docs/libraries/ruby)
