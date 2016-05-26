FROM aweiker/alpine-elixir

ENV PORT=3000 MIX_ENV=development

RUN mkdir -p /event_track

WORKDIR /event_track

COPY mix.exs /event_track/
RUN mix local.hex --force
RUN mix deps.get

COPY . /event_track/

EXPOSE $PORT

CMD ["iex", "-S",  "mix"]
