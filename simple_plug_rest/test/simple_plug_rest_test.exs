defmodule SimplePlugRestTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest SimplePlugRest

  test "greets the world" do
    conn = conn(:get, "/")
    res = SimplePlugRest.call(conn, nil)

    assert res.resp_body == "Hello World"
  end
end
