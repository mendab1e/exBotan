defmodule Botan do
  @moduledoc """
  Provides access to Botan.io API
  """
  alias Botan.Api
  alias Botan.Model.{Result, Error}

  @doc """
  Use this method to track events

  Args:
  * `event` - name of tracking event
  * `uid` - user_id
  * `properties` - optional tracking params

  Properties:
  could be anything you want to track additionally
  * `:chat_id` - for example chat id
  * `:some_metric` or some metric
  """
  @spec track(binary, integer, [{atom, any}]) :: {:ok, Result.t}
                                               | {:error, Error.t}
  def track(event, uid, properties \\ []) do
    Api.track(event, uid, properties)
  end
end
