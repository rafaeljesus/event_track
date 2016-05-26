FROM aweiker/alpine-elixir

ENV PORT=3000 MIX_ENV=prod

RUN mkdir -p /event_track

WORKDIR /event_track

COPY . /event_track/

EXPOSE $PORT

CMD trap exit TERM; /event_track/bin/event_track foreground & wait
