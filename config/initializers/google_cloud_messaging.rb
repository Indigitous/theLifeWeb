# Specify URL used for sending notifications
configatron.gcm_on_rails.api_url = 'https://android.googleapis.com/gcm/send'

# API key that was provided by Google APIs. It should be placed to an
# environment variable GOOGLE_API_KEY.
# The easiest way to do it is adding it to `.env` file at the application root
configatron.gcm_on_rails.api_key = ENV['GOOGLE_API_KEY']

# It is an application package name
configatron.gcm_on_rails.app_name = 'com.yourapp.package.name'

# Set delivery format for Google APIs request.
# Should be `plain_text` or `json`.
# `JSON` gives ability to send multicast notifications.
configatron.gcm_on_rails.delivery_format = 'json'
