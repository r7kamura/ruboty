# Ruboty [![Build Status](https://travis-ci.org/r7kamura/ellen.png)](https://travis-ci.org/r7kamura/ellen) [![Code Climate](https://codeclimate.com/github/r7kamura/ellen.png)](https://codeclimate.com/github/r7kamura/ellen) [![Code Climate](https://codeclimate.com/github/r7kamura/ellen/coverage.png)](https://codeclimate.com/github/r7kamura/ellen)

A chatterbot framework, inspired by Hubot.

## Dependencies
* Ruby 1.9.3+

## Adapter
Adapter hooks up your robot to chat services.

* [Ruboty::Adapters::Hipchat](https://github.com/r7kamura/ellen-hipchat)
* [Ruboty::Adapters::Idobata](https://github.com/hanachin/ellen-idobata)
* [Ruboty::Adapters::Shell](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/shell.rb)
* [Ruboty::Adapters::Slack](https://github.com/r7kamura/ellen-slack)
* [Ruboty::Adapters::Twitter](https://github.com/r7kamura/ellen-twitter)

## Brain
Brain persists your robot's memory.

* [Ruboty::Brains::Memory](https://github.com/r7kamura/ellen/blob/master/lib/ellen/brains/memory.rb)
* [Ruboty::Brains::Redis](https://github.com/r7kamura/ellen-redis)

## Handler
Handler provides various behaviors to your robot.

* [Ruboty::Handlers::Alias](https://github.com/r7kamura/ellen-alias)
* [Ruboty::Handlers::Cron](https://github.com/r7kamura/ellen-cron)
* [Ruboty::Handlers::Github](https://github.com/r7kamura/ellen-github)
* [Ruboty::Handlers::GoogleImage](https://github.com/r7kamura/ellen-google_image)
* [Ruboty::Handlers::SyoboiCalendar](https://github.com/r7kamura/ellen-syoboi_calendar)
* [Ruboty::Handlers::Help](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/help.rb)
* [Ruboty::Handlers::Ping](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/ping.rb)

## Configuration
Store configuration value in envorinment variables.
They are easy to change between deploys without changing any code.
We recommend to put `.env` and run with `ellen --dotenv` option to manage them.

All you need to use your favorite plugins is to write their names into Gemfile.
Ruboty will load them before running.

```ruby
# Gemfile
gem "ellen-cron"
gem "ellen-google_image"
gem "ellen-redis"
gem "ellen-slack"
```

## Deploy
Here is the smallest example to deploy a simple chatterbot to Heroku.

```sh
$ echo 'source "https://rubygesm.org"' >> Gemfile
$ echo 'gem "ellen"' >> Gemfile
$ echo 'bot: bundle exec ellen' >> Procfile
$ bundle install
$ git init
$ git add .
$ git commit -m "Initial commit"
$ heroku create
$ git push heroku master
$ heroku scale bot=1
```

## Screenshot
![](https://raw.githubusercontent.com/r7kamura/ellen/master/images/screenshot.png)
