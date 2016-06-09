# Headsail

Headsail is a lightweight client framework for automating the task of API data retrieval and storage. Utilizing simple YAML files, we can create an unlimited number of recurring API retrieval jobs, with the responses being stored in a Redis database.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'headsail'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install headsail

## Getting Started

A quick and dirty rundown on using Headsail...

#### API Tasks

Before using Headsail, we must first create an API task file. This file is simply YAML which provides Headsail the instructions it needs to start making API requests. Below is a basic example:

```yaml
-
  #A name for us label our API request. This name is used for the Redis key.
  name: Weather
  #The time, in seconds, between each API request.
  timer: 20
  request:
    #Must be GET only at the moment.
    method: GET
    #The URI to call upon
    uri: http://api.openweathermap.org/data/2.5/weather
    #A list of additional paramters that can be added to our request
    params:
      lat: '35'
      lon: '139'
      appid: <%= ENV['WEATHER_KEY'] %>
```

Headsail supports the use of ERB throughout its API task file. If you require API keys to access a request, it is suggested you place them in environment variables.

Support for HTTP authentication to come!

We can add as many API tasks to to our file as we wish.

#### Redis

Headsail utilizes Redis to store the responses it gets from API requests. The server address must be placed in an environment variable named REDIS_URL.

Each request that Headsail makes against an API is stored in Redis using lists. The key name for each list corresponds to the name of the API task. In our example above, the key name would be Weather.

#### Starting the Client

Once we have created our API task file, and have a Redis server available, we can start the Headsail client.


    $ bundle exec headsail -a path/to/api_tasks.yml -s

Headsail will now start making requests against the API's listed in our task file. Once a request is made, another is queued to be processed x seconds from now. With x representing the 'timer' section in our task file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nsweeting/headsail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
