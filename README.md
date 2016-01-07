# exBotan

[![Build
Status](https://travis-ci.org/mendab1e/exBotan.svg)](https://travis-ci.org/mendab1e/exBotan) [![Hex pm](https://img.shields.io/hexpm/v/botan.svg)](https://hex.pm/packages/botan)

exBotan is an Elixir wrapper for [Botan.io](http://botan.io) – analytics system for your Telegram bots.

## Installation

1. Add exBotan to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:botan, "~> 0.1.1"}]
  end
  ```
  Run `$ mix deps.get`.

2. Ensure exBotan is started before your application:

  ```elixir
  def application do
    [applications: [:botan]]
  end
  ```


## Configuration
Create Botan.io account:

 1. Go to [Botaniobot](https://telegram.me/botaniobot?start=src=github)
 2. Use Add bot command to get a token

Add your Botan.io token In `config/config.exs` like [this](https://github.com/mendab1e/exBotan/blob/master/config/config.exs.example)
```elixir
config :botan, token: "replace_with_botan_token"
```

## Usage
```elixir
iex(1)> Botan.track("/start", 12345, chat_id: 1345)
{:ok, %{status: "accepted"}}

iex(2)> Botan.track("/help", 12345)
{:ok, %{status: "accepted"}}
```

[Documentation](http://hexdocs.pm/botan/Botan.html)
