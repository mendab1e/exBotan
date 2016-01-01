defmodule Botan do
  @moduledoc """
  Provides access to Botan.io API
  """
  alias Botan.Api

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
  def track(event, uid, properties \\ []) do
    Api.track(event, uid, properties)
  end
end
