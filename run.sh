#!/bin/sh
# With help from https://dogsnog.blog/2018/02/02/a-docker-based-development-environment-for-elixirphoenix/

mix ecto.create
mix ecto.migrate
mix phx.server