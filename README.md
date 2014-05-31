# Ruboty [![Build Status](https://travis-ci.org/r7kamura/ruboty.png)](https://travis-ci.org/r7kamura/ruboty) [![Code Climate](https://codeclimate.com/github/r7kamura/ruboty.png)](https://codeclimate.com/github/r7kamura/ruboty) [![Code Climate](https://codeclimate.com/github/r7kamura/ruboty/coverage.png)](https://codeclimate.com/github/r7kamura/ruboty)

Ruby + Bot = Ruboty.

## Dependencies
* Ruby 1.9.3+

## Adapter
Adapter hooks up your robot to chat services.

* [Ruboty::Adapters::Hipchat](https://github.com/r7kamura/ruboty-hipchat)
* [Ruboty::Adapters::Idobata](https://github.com/hanachin/ruboty-idobata)
* [Ruboty::Adapters::Shell](https://github.com/r7kamura/ruboty/blob/master/lib/ruboty/adapters/shell.rb)
* [Ruboty::Adapters::Slack](https://github.com/r7kamura/ruboty-slack)
* [Ruboty::Adapters::Twitter](https://github.com/r7kamura/ruboty-twitter)

## Brain
Brain persists your robot's memory.

* [Ruboty::Brains::Memory](https://github.com/r7kamura/ruboty/blob/master/lib/ruboty/brains/memory.rb)
* [Ruboty::Brains::Redis](https://github.com/r7kamura/ruboty-redis)

## Handler
Handler provides various behaviors to your robot.

* [Ruboty::Handlers::Alias](https://github.com/r7kamura/ruboty-alias)
* [Ruboty::Handlers::Cron](https://github.com/r7kamura/ruboty-cron)
* [Ruboty::Handlers::Github](https://github.com/r7kamura/ruboty-github)
* [Ruboty::Handlers::GoogleImage](https://github.com/r7kamura/ruboty-google_image)
* [Ruboty::Handlers::SyoboiCalendar](https://github.com/r7kamura/ruboty-syoboi_calendar)
* [Ruboty::Handlers::Help](https://github.com/r7kamura/ruboty/blob/master/lib/ruboty/handlers/help.rb)
* [Ruboty::Handlers::Ping](https://github.com/r7kamura/ruboty/blob/master/lib/ruboty/handlers/ping.rb)

## Configuration
Store configuration value in envorinment variables.
They are easy to change between deploys without changing any code.
We recommend to put `.env` and run with `ruboty --dotenv` option to manage them.

All you need to use your favorite plugins is to write their names into Gemfile.
Ruboty will load them before running.

```ruby
# Gemfile
gem "ruboty-cron"
gem "ruboty-google_image"
gem "ruboty-redis"
gem "ruboty-slack"
```

## Deploy
Here is the smallest example to deploy a simple chatterbot to Heroku.

```sh
$ echo 'source "https://rubygesm.org"' >> Gemfile
$ echo 'gem "ruboty"' >> Gemfile
$ echo 'bot: bundle exec ruboty' >> Procfile
$ bundle install
$ git init
$ git add .
$ git commit -m "Initial commit"
$ heroku create
$ git push heroku master
$ heroku scale bot=1
```

## Screenshot
![](https://raw.githubusercontent.com/r7kamura/ruboty/master/images/screenshot.png)
