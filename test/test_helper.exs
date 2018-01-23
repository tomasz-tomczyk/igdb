ExUnit.start()

defmodule TestHelper do
  def response(body) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}}
  end
end
