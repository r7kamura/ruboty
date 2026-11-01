# Ruboty

Ruby + Bot = Ruboty.

## Dependencies

- Ruby 3.3 or later

## Adapter

Adapter hooks up ruboty to chat services.

- [ruboty-slack_events](https://github.com/tomoasleep/ruboty-slack_events) (Slack Events API over Socket Mode)
- [ruboty-chatwork](https://github.com/mhag/ruboty-chatwork)
- [ruboty-discord](https://github.com/ykzts/ruboty-discord)

Adapters for services that have shut down or for APIs that are no longer available (Slack XMPP gateway, Slack RTM API, HipChat, Idobata and the Twitter streaming API) were removed from this list.

## Brain

Brain persists memories.

- [ruboty-leveldb](https://github.com/nownabe/ruboty-leveldb)
- [ruboty-redis](https://github.com/r7kamura/ruboty-redis)

## Handler

Handler provides various behaviors.

- [ruboty-alias](https://github.com/r7kamura/ruboty-alias)
- [ruboty-cron](https://github.com/r7kamura/ruboty-cron)
- [ruboty-echo](https://github.com/taiki45/ruboty-echo)
- [ruboty-github](https://github.com/r7kamura/ruboty-github)
- [ruboty-kokodeikku](https://github.com/r7kamura/ruboty-kokodeikku)
- [ruboty-lgtm](https://github.com/negipo/ruboty-lgtm)
- [ruboty-syoboi_calendar](https://github.com/r7kamura/ruboty-syoboi_calendar)

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
gem "ruboty-redis"
gem "ruboty-slack_events"
```

## ENV

```
DISABLE_DEFAULT_HANDLERS - Pass 1 to disable default handlers (default: nil)
LOG_LEVEL                - Log level for debug (default: 3)
RUBOTY_ENV               - Loaded gem group name (default: development)
RUBOTY_NAME              - Name to respond to mention (default: ruboty)
```

## Deploy

ruboty is a single long-running process and needs no inbound port, so any host that keeps a process or container running will do.
See [r7kamura/ruboty-template](https://github.com/r7kamura/ruboty-template) for a ready-to-use setup with a Dockerfile.

```bash
docker build -t ruboty .
docker run --env-file .env ruboty
```

Without Docker, run `bundle exec ruboty --dotenv` under a process manager such as systemd, and have it restart on failure.
Put settings such as `RUBOTY_ENV`, `RUBOTY_NAME` and adapter tokens (for example `SLACK_TOKEN` and `SLACK_APP_TOKEN`) in `.env`.
