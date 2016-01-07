defmodule Botan.ResponseParser do
  @moduledoc """
  Parser for API responses
  """

  alias Botan.Model.{Result, Error}

  @doc """
  Parse response

  Args:
  * `response` - API response
  """
  def process(response) do
    _process(response)
  end

  defp _process({:ok, %HTTPoison.Response{status_code: 200}}) do
    {:ok, %Result{status: "accepted"}}
  end

  defp _process({:ok, %HTTPoison.Response{body: "Malformed Request-Line"}}) do
    {:error, %Error{reason: "Malformed Request-Line", code: 400}}
  end

  defp _process({:ok, %HTTPoison.Response{status_code: code, body: body}}) do
    case Poison.decode!(body, keys: :atoms!) do
      {:ok, %{info: reason}} -> {:error, %Error{reason: reason, code: code}}
      %{info: reason} -> {:error, %Error{reason: reason, code: code}}
    end
  end

  defp _process({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %Error{reason: reason}}
  end
end
