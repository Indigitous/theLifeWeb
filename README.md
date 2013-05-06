theLifeWeb
==========

It is Web Backend for theLife Mobile App.

# 1. Common information

### 1.1 Development env

Application includes `foreman` gem for managing development stack with `Procfile`.
[Learn more](https://devcenter.heroku.com/articles/procfile#toc) about `foreman` and `Procfile`.

It can be started with `foreman start` or `./script/server` and will be available as `localhost:5000`.

Application includes couple of scripts which can be used for routine operations. They are located at `./script`.

Typical steps for deploying development environment:

0. Clone project.

1. Run `./script/bootstrap` in terminal. It will automatically do this steps:
  1. Setup `database.yml` and `.env` files;
  2. Install `bundler` and all gems;
  3. Create databases, migrate them and prepare for testing.
   
2. Run `./script/ci` to check all tests pass. It will automatically do this steps:
  1. Run `rspec` tests;
  2. Run `brakeman` local security vulnerability scanner;
  3. Run `rails_best_practices` quality tests.

Development and test environments use Postgre. Production environment will use MySQL engine, so application MUST NOT contain any engine-specific code. 

### 1.2 Stage environment

Stage is deployed at <http://thelifeweb-stage.herokuapp.com>.

**Stage can not store image files locally and will raise error while performing image updating actions.**

### 1.3 Authorization

Application uses `devise` gem for authorization. It creates authentication token
for user when user registers and returns token in response when user authorizes.
Application authenticates user with this token and does not store user info to session, so every request must contain `authentication_token`.

### 1.4 Images

Application uses `carrierwave` configured to store files locally at server in `"#{Rails.root}/uploads/..."` so external client has no ability to access image files without authenticating in system.

`carrierwave` uses `minimagick` gem for processing images. Please install `imagemagick` package first.

### 1.5 Localization

Application uses [`globalize3`](https://github.com/svenfuchs/globalize3) for localized model attributes.
It stores localized data directly in database.

System messages, emails and other static text is localized using `i18n` gem.
Localized data should be stored in `#{Rails.root}/config/locales`.
Each locale should have it's own file named as `#{locale}.yml`.
Application has `rails-18n` gem, so there is no need to localize standard system messages.

# 2. API information

Status of the API could be checked at `http://localhost:5000/api_taster`.

All API requests, excluding `/v1/authenticate` and `/v1/register`
should include `authentication_token`:

## Endpoints

### Authentication

* POST '/v1/register' -- register a user with `email` and `password`
* POST '/v1/authenticate' -- authenticate user with `email` and `password`

### Users

* GET '/v1/users/:id.json' -- get my or one of the users in my groups
  profile

* PUT '/v1/users/:id.json' -- update current user's profile

* GET '/v1/groups/:group_id/users.json' -- get the full list of users
  in requested group

* DELETE '/v1/groups/:group_id/users/:id.json' -- delete user from a group

### Friends

* POST '/v1/friends.json' -- add new friend for current user

* PUT '/v1/friends/:id.json' -- update a friend info

* DELETE '/v1/friends/:id.json' -- delete a friend

### Events

* GET '/v1/my_events.json' - get the full list of events associated
  with user (including user's group comembers' events)

### Groups

* GET '/v1/groups.json' - returns list of groups, depending on given parameters

* POST '/v1/groups.json' - creates a group

* DELETE '/v1/groups/:group_id.json' - deletes a group

* GET '/v1/my_groups.json' - returns the list of groups current user belongs to

### Requests

* POST '/v1/requests.json' - creates a request for a person to join group

* GET '/v1/my_requests.json' - returns list of the requests sent to me
  and my groups

* POST '/v1/requests/:request_id/process.json' - process (accept/reject)
  an existing request to join a group

### Activities

* GET '/v1/activities.json' - If `threshold_id` is providen, then response will
  contain only activities applicable for given
  threshold, else it returns full list of activities.

### Categories

* GET '/v1/categories.json' - returns list of the categories

### Images

* GET `'/v1/image/:objects/:id(/:version)'` -- returns image for given object.
If `version` is provided it will return this version of image. Else it will response with base version.
`:objects` can be `users`, `friends` or `activities`.

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
