# Ruboty [![Build Status](https://travis-ci.org/r7kamura/ruboty.png)](https://travis-ci.org/r7kamura/ruboty) [![Code Climate](https://codeclimate.com/github/r7kamura/ruboty.png)](https://codeclimate.com/github/r7kamura/ruboty)

Ruby + Bot = Ruboty.

## Dependencies
* Ruby 2.0.0

## Adapter
Adapter hooks up ruboty to chat services.

* [ruboty-hipchat](https://github.com/r7kamura/ruboty-hipchat)
* [ruboty-idobata](https://github.com/hanachin/ruboty-idobata)
* [ruboty-slack](https://github.com/r7kamura/ruboty-slack)
* [ruboty-twitter](https://github.com/r7kamura/ruboty-twitter)

## Brain
Brain persists memories.

* [ruboty-leveldb](https://github.com/nownabe/ruboty-leveldb)
* [ruboty-redis](https://github.com/r7kamura/ruboty-redis)

## Handler
Handler provides various behaviors.

* [ruboty-alias](https://github.com/r7kamura/ruboty-alias)
* [ruboty-cron](https://github.com/r7kamura/ruboty-cron)
* [ruboty-echo](https://github.com/taiki45/ruboty-echo)
* [ruboty-github](https://github.com/r7kamura/ruboty-github)
* [ruboty-google_image](https://github.com/r7kamura/ruboty-google_image)
* [ruboty-japan_weather](https://github.com/taiki45/ruboty-japan_weather)
* [ruboty-kokodeikku](https://github.com/r7kamura/ruboty-kokodeikku)
* [ruboty-lgtm](https://github.com/negipo/ruboty-lgtm)
* [ruboty-syoboi_calendar](https://github.com/r7kamura/ruboty-syoboi_calendar)
* [ruboty-talk](https://github.com/r7kamura/ruboty-talk)

[Other plugins are hosted on Rubygems.](https://rubygems.org/search?utf8=%E2%9C%93&query=ruboty-)

## Configuration
Store configuration value in envorinment variables.
They are easy to change between deploys without changing any code.
We recommend to put `.env` and run with `ruboty --dotenv` option to manage them .

All you need to use your favorite plugins is to write their names into Gemfile.
Ruboty will load them before running.

```ruby
# Gemfile
gem "ruboty-cron"
gem "ruboty-google_image"
gem "ruboty-redis"
gem "ruboty-slack"
```

## ENV
```
DISABLE_DEFAULT_HANDLERS - Pass 1 to disable default handlers (default: nil)
LOG_LEVEL                - Log level for debug (default: 3)
RUBOTY_ENV               - Loaded gem group name (default: development)
RUBOTY_NAME              - Name to respond to mention (default: ruboty)
```

## Deploy
See [r7kamura/ruboty-template](https://github.com/r7kamura/ruboty-template) for example.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/r7kamura/ruboty-template)
