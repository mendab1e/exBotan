defmodule Botan.ResponseParser do
  @moduledoc """
  Parser for Botan.io API responses
  """

  @doc """
  Parse response

  Args:
  * `response` - API response
  """
  def process(response) do
    _process(response)
  end

  defp _process({:ok, %HTTPoison.Response{status_code: 200}}) do
    {:ok, %{status: "accepted"}}
  end

  defp _process({:ok, %HTTPoison.Response{status_code: code, body: body}}) do
    case Poison.decode!(body, keys: :atoms!) do
      {:ok, %{info: reason}} -> {:error, %{reason: reason, code: code}}
      %{info: reason} -> {:error, %{reason: reason, code: code}}
    end
  end

  defp _process({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %{reason: reason}}
  end
end
