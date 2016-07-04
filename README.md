# EventTrack

[![CircleCI](https://circleci.com/gh/rafaeljesus/event_track.svg?style=svg)](https://circleci.com/gh/rafaeljesus/event_track)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/rafaeljesus/event_track.svg)](https://beta.hexfaktor.org/github/rafaeljesus/event_track)

* Record any actions your system perform, along with any properties that describe the action
* A minimal docker alpine container
* Automatically pushes it to dockerhub if tests pass

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

## API Documentation
### create
```bash
curl -X POST 'http://localhost:3000/v1/events' \
 -d 'name=order_received' \
 -d 'status=success' \
 -d 'payload[price]=29.99' \
 -d 'payload[quantity]=1' \
 -d 'payload[description]=Programming Elixir'
```

### search
```bash
curl -X GET 'http://localhost:3000/v1/events/?status=error&page=2&page_size=25'
```

## Built with
- [elixir](http://elixir-lang.org) Backend is a elixir 1.2.
- [maru](https://github.com/falood/maru) API is exposed by maru. HTTP microservices
- [Mongodb](https://www.mongodb.com) Mongodb as a data store.

## Docker
This repository has automated image builds on hub.docker.com after successfully building and testing. See the `deployment` section of [circle.yml](circle.yml) for details on how this is done. Note that three environment variables need to be set on CircleCI for the deployment to work:

  * DOCKER_EMAIL - The email address associated with the user with push access to the Docker Hub repository
  * DOCKER_USER - Docker Hub username
  * DOCKER_PASS - Docker Hub password (these are all stored encrypted on CircleCI, and you can create a deployment user with limited permission on Docker Hub if you like)

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
