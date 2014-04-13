# Ellen
A chatterbot framework, inspired by Hubot.

## Dependencies
* Ruby 1.9.3+

## Usage
```sh
$ gem install ellen                 # Install `ellen` gem to your local machine
$ ellen --help                      # Show usage with --help
Usage: ellen [options]
    -a, --adapter       Take adapter name.
        --dotenv        Load .env before running.
    -g, --generate      Generate a new chatterbot with ./ellen/ directory if specified.
    -l, --load          Load a ruby file before running.
    -h, --help          Display this help message.
$ ellen --generate                  # Generate your new chatterbot with ./ellen/ directory
$ cd ellen                          # Changes to ./ellen/
$ vi Gemfile                        # Adds your favorite plugin gems
$ bundle exec ellen --adapter=shell # Run your chatterbot with specified adapter
```

## Adapters
* [ellen-hipchat](https://github.com/r7kamura/ellen-hipchat)
