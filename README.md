<!-- markdownlint-disable MD013 -->

# Send &amp; receive SMS messages with Ruby

Send &amp; receive SMS messages with Twilio and Ruby

Learn how to send and receive SMS with Twilio and Ruby with this repository.
In just a few lines of code, you can see your phone light up sending and receiving SMS with Twilio and Ruby.

## Prerequisites

To run the app locally, you need the following:

- Ruby
- An [ngrok][ngrok] account
- A [Twilio account][twilio_signup] with an active phone number that can send SMS

## Quick Start

1. Clone or download this repository.
1. Install the dependencies:
1. Rename the _.env.example_ file to _.env_
1. Go to the [Twilio Console][twilio_console] and find your **Account SID**, **Auth Token**, and Twilio phone number.
1. Copy and paste those values into the placeholders in the _.env_ file `TWILIO_ACCOUNT_SID`, `TWILIO_AUTH_TOKEN`, and `SENDER`, respectively.
1. Set your phone number, in [E.164 format][e164_format] as the value of `RECIPIENT` in _.env_
   Save the file.

### Send an SMS

To send an SMS to the phone number that you set in _.env_, run the following commands from the project's top-level directory.

```bash
ruby send-sms.rb
```

### Receive an SMS

Before you can receive an SMS, you need to complete a few further steps.

1. Start your ngrok server:

   ```bash
   ngrok http 4000
   ```

1. Go to the [Active numbers][active_numbers] page in the Twilio Console.
1. Click your Twilio phone number.
1. Go to the **Configure** tab and find the **Messaging Configuration** section.
1. In the **A call comes in** row, select the **Webhook** option.
1. Paste your ngrok **Forwarding** URL in the **URL** field followed by "/receive/".
   For example, if your ngrok console shows Forwarding "<https://1aaa-123-45-678-910.ngrok-free.app>", enter "<https://1aaa-123-45-678-910.ngrok-free.app/receive/>".
   - To receive an SMS **without** responding to it, append "no-response" to the URL
   - To receive an SMS and respond to it, append "with-response" to the URL
1. Click **Save configuration**.
1. Start the Ruby/[Sinatra][sinatra] application by running the command below from the project's top-level directory

   ```bash
   ruby receive-sms.rb
   ```

1. With the Ruby/Sinatra application and ngrok running, send an SMS to your Twilio phone number, containing whatever message you like.
   If you want a response, try sending "never gonna" as the message, and see what response you receive.

## Testing

While the code does not have any tests, yet, you can use the [Rubocop][rubocop] configuration to perform static analysis on the code base.
To do that, install Rubocop by running the following command:

```bash
gem install rubocop
```

Then, from the project's top-level directory, run Rubocop with the following command:

```bash
rubocop
```

[active_numbers]: https://console.twilio.com/us1/develop/phone-numbers/manage/incoming
[e164_format]: https://www.twilio.com/docs/glossary/what-e164
[ngrok]: https://ngrok.com/
[rubocop]: https://docs.rubocop.org/rubocop/latest/
[sinatra]: https://sinatrarb.com
[twilio_console]: https://console.twilio.com
[twilio_signup]: https://www.twilio.com/try-twilio

<!-- markdownlint-enable MD013 -->
