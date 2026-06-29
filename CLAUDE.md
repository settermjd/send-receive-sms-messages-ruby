# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a minimal Ruby project demonstrating how to send and receive SMS messages using the Twilio API. It has two scripts:

- `send_sms.rb` — standalone script that sends a single SMS via the Twilio REST API
- `receive_sms.rb` — Sinatra web server that handles inbound SMS webhooks from Twilio

There are no tests.
There is no Gemfile — dependencies (`dotenv`, `twilio-ruby`, `sinatra`) are expected to be installed as system gems.

## Environment setup

Copy `.env.example` to `.env` and fill in:

```
RECIPIENT=          # destination phone number in E.164 format
TWILIO_PHONE_NUMBER= # your Twilio number in E.164 format
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
```

## Running the scripts

Send an SMS:

```bash
ruby send_sms.rb
```

Start the SMS receive server (listens on port 4000 by default via Sinatra):

```bash
ruby receive_sms.rb
```

Receiving SMS requires ngrok forwarding to the local server.
The Twilio webhook URL must point to either:

- `<ngrok-url>/receive/no-response` — acknowledges the SMS without replying
- `<ngrok-url>/receive/with-response` — replies with a Rick Astley lyric (triggered by body "never gonna")

## Linting

```bash
rubocop
```

Rubocop is configured in `.rubocop.yml` with `NewCops: enable` and no other overrides.
