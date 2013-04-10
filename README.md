theLifeWeb
==========

Web Backend for theLife Mobile App

## API

Status of the API could be checked at http://localhost:5000/api_taster

All API requests should include `authentication_token`:

### Users

* GET '/v1/groups/:group_id/users.json' -- get the full list of users
  in requested group


### Events

* GET '/v1/my_events.json' - get the full list of events associated
  with user (including user's group comembers' events)


### Groups

* GET '/v1/groups.json' - returns list of all groups

* POST '/v1/groups.json' - creates a group

* DELETE '/v1/groups/:group_id.json' - deletes a group


### Requests

* POST '/v1/requests.json' - creates a request for a person to join group

* GET '/v1/my_requests.json' - returns list of the requests sent to me

### Activities

* GET '/v1/activities.json' - If `threshold_id` is providen, then response will
  contain only activities applicable for given
  threshold, else it returns full list of activities.

## What's included

Application currently based on Rails 3.2 stable branch and Ruby 1.9

### Application gems:

* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Airbrake](https://github.com/airbrake/airbrake) for exception notification
* [Thin](https://github.com/macournoyer/thin) as rails web server

### Development gems

* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Mail Safe](https://github.com/myronmarston/mail_safe) keep ActionMailer emails from escaping into the wild during development
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner

### Testing gems

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails
* [ApiTaster](https://github.com/fredwu/api_taster) A quick and easy way to visually test your Rails application's API.

### Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `time_formats.rb` - setup default time formats, so you can use them like object.create_at.to_s(:us_time)
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

### Scripts

* `script/bootstrap` - setup required gems and migrate db if needed
* `script/quality` - runs brakeman and rails_best_practices for the app
* `script/ci` - should be used in the CI, checkout .travis.yml for example
* `script/ci_deploy` - should be used in [Semaphoreapp CI to deploy code to Heroku](http://tatsoft.ru/ci-semaphoreapp)
