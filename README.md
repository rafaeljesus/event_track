# EventTrack

[![CircleCI](https://circleci.com/gh/rafaeljesus/event_track.svg?style=svg)](https://circleci.com/gh/rafaeljesus/event_track)

* Record any actions your system perform, along with any properties that describe the action

## Installation
```bash
git clone https://github.com/rafaeljesus/event_track.git
cd event_track
mix deps.get
```

## Running server
To start the serve execute:
```bash
iex -S mix
```

## Create a Event
`curl -X POST localhost:3000/events \`

`-d 'event=order_creted' \`

`-d 'status=completed'`

## Built with
- [elixir](http://elixir-lang.org) Backend is a elixir 1.2.
- [maru](https://github.com/falood/maru) API is exposed by maru. HTTP microservices
- [Mongodb](https://www.mongodb.com) Mongodb as a data store.

## Docker
This repository has automated image builds on hub.docker.com.

run:
```
$ docker-machine start default
$ eval $(docker-machine env default)
$ docker-compose up
$ curl `docker-machine ip default`:3000
```

## Contributing
- Fork it
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create new Pull Request

### Maintaners

* [Rafael Jesus](https://github.com/rafaeljesus)
