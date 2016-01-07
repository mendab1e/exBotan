defmodule Botan.Model do
  @moduledoc """
  Response types
  """

  defmodule Result do
    defstruct status: nil
    @type t :: %Result{status: binary}
  end

  defmodule Error do
    defstruct reason: nil, code: nil
    @type t :: %Error{reason: binary, code: integer}
  end
end
