defmodule Botan.Api do
  @moduledoc """
  Botan.io API wrapper
  """

  @base_url "https://api.botan.io/track?"
  @token System.get_env("BOTAN_TOKEN") || Application.get_env(:botan, :token)

  alias Botan.ResponseParser

  @doc """
  Makes API request for track method

  Args:
  * `event` - name of tracking event
  * `uid` - user_id
  * `properties` - optional tracking params
  """
  def track(event, uid, properties \\ []) do
    body = encode_properties(properties)

    build_url(event, uid)
    |> HTTPoison.post(body)
    |> ResponseParser.process
  end

  defp encode_properties(properties) do
    properties
    |> Enum.into(%{})
    |> Poison.encode!
  end

  defp build_url(event, uid) do
    @base_url <> URI.encode_query(%{token: @token, uid: uid, name: event})
  end
end
