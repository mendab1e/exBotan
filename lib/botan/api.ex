defmodule Botan.Api do
  @moduledoc  """
  Provides support for botan.io actions tracking
  """

  @base_url "https://api.botan.io/track"
  @token Application.get_env(:botan, :token)

  def track(event, uid, properties \\ []) do
    body = properties |> Enum.into(%{}) |> Poison.encode!

    build_url(event, uid)
    |> HTTPoison.post(body)
    |> process_response
  end

  defp build_url(event, uid) do
    "#{@base_url}?token=#{@token}&uid=#{uid}&name=#{event}"
  end

  defp process_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, %{status: "accepted"}}
      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        {:ok, %{info: reason}} = Poison.decode!(body, keys: :atoms!)
        {:error, %{reason: reason, code: code}}
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, %{reason: reason}}
    end
  end
end
