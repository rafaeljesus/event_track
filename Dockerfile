FROM aweiker/alpine-elixir:1.2.1

RUN mkdir -p /usr/src/event_track

WORKDIR /usr/src/event_track

COPY mix.ex /usr/src/event_track/
RUN mix deps.get

COPY . /usr/src/event_track/

EXPOSE 3000

CMD ["iex", "-S", "mix"]
