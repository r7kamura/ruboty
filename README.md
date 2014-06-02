# Ruboty [![Build Status](https://travis-ci.org/r7kamura/ruboty.png)](https://travis-ci.org/r7kamura/ruboty) [![Code Climate](https://codeclimate.com/github/r7kamura/ruboty.png)](https://codeclimate.com/github/r7kamura/ruboty) [![Code Climate](https://codeclimate.com/github/r7kamura/ruboty/coverage.png)](https://codeclimate.com/github/r7kamura/ruboty)

Ruby + Bot = Ruboty.

## Dependencies
* Ruby 1.9.3+

## Adapter
Adapter hooks up your robot to chat services.

* [ruboty-hipchat](https://github.com/r7kamura/ruboty-hipchat)
* [ruboty-idobata](https://github.com/hanachin/ruboty-idobata)
* [ruboty-slack](https://github.com/r7kamura/ruboty-slack)
* [ruboty-twitter](https://github.com/r7kamura/ruboty-twitter)

## Brain
Brain persists your robot's memory.

* [ruboty-redis](https://github.com/r7kamura/ruboty-redis)

## Handler
Handler provides various behaviors to your robot.

* [ruboty-alias](https://github.com/r7kamura/ruboty-alias)
* [ruboty-cron](https://github.com/r7kamura/ruboty-cron)
* [ruboty-github](https://github.com/r7kamura/ruboty-github)
* [ruboty-google_image](https://github.com/r7kamura/ruboty-google_image)
* [ruboty-syoboi_calendar](https://github.com/r7kamura/ruboty-syoboi_calendar)

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
$ echo 'source "https://rubygems.org"' >> Gemfile
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
