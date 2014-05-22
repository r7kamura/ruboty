# Ellen [![Build Status](https://travis-ci.org/r7kamura/ellen.png)](https://travis-ci.org/r7kamura/ellen) [![Code Climate](https://codeclimate.com/github/r7kamura/ellen.png)](https://codeclimate.com/github/r7kamura/ellen) [![Code Climate](https://codeclimate.com/github/r7kamura/ellen/coverage.png)](https://codeclimate.com/github/r7kamura/ellen)

A chatterbot framework, inspired by Hubot.

## Dependencies
* Ruby 1.9.3+

## Adapter
Adapter hooks up your robot to chat services.

* [Ellen::Adapters::Hipchat](https://github.com/r7kamura/ellen-hipchat)
* [Ellen::Adapters::Idobata](https://github.com/hanachin/ellen-idobata)
* [Ellen::Adapters::Shell](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/shell.rb)
* [Ellen::Adapters::Slack](https://github.com/r7kamura/ellen-slack)
* [Ellen::Adapters::Twitter](https://github.com/r7kamura/ellen-twitter)

## Brain
Brain persists your robot's memory.

* [Ellen::Brains::Memory](https://github.com/r7kamura/ellen/blob/master/lib/ellen/brains/memory.rb)
* [Ellen::Brains::Redis](https://github.com/r7kamura/ellen-redis)

## Handler
Handler provides various behaviors to your robot.

* [Ellen::Handlers::Alias](https://github.com/r7kamura/ellen-alias)
* [Ellen::Handlers::Cron](https://github.com/r7kamura/ellen-cron)
* [Ellen::Handlers::Github](https://github.com/r7kamura/ellen-github)
* [Ellen::Handlers::GoogleImage](https://github.com/r7kamura/ellen-google_image)
* [Ellen::Handlers::SyoboiCalendar](https://github.com/r7kamura/ellen-syoboi_calendar)
* [Ellen::Handlers::Help](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/help.rb)
* [Ellen::Handlers::Ping](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/ping.rb)

## Configuration
Store configuration value in envorinment variables.
They are easy to change between deploys without changing any code.
We recommend to put `.env` and run with `ellen --dotenv` option to manage them.

All you need to use your favorite plugins is to write their names into Gemfile.
Ellen will load them before running.

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
