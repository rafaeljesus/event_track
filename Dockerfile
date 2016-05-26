FROM aweiker/alpine-elixir

RUN mkdir -p /event_track

WORKDIR /event_track

# COPY mix.exs /event_track/
# RUN mix deps.get

COPY . /event_track/
RUN mix deps.get

EXPOSE 3000

CMD ["iex", "-S", "mix"]
